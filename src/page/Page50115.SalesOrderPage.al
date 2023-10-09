pageextension 50115 "PEG Sales Quote Extension" extends "Sales Quote Subform"
{
    layout
    {
        addfirst(content)
        {
            field("PEG Group Toggle"; Rec."PEG Group Toggle")
            {
                Caption = 'Turn on grouping';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    if ShowGroupColumn = true then begin
                        ShowGroupColumn := false;
                    end else begin
                        ShowGroupColumn := true;
                    end;
                end;
                
            }
        }

        addbefore("Location Code")
        {
            field("PEG Group"; Rec."PEG Group")
            {
                Caption = 'Group';
                ApplicationArea = All;
                Visible = ShowGroupColumn;
            }
        }
    }

    actions
    {
        addlast("F&unctions")
        {
            action("Calculate Groups")
            {
                Caption = 'Calculate Groups';
                ApplicationArea = Basic, Suite;
                Image = Calculate;
                Visible = ShowGroupColumn;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    Table: Record "Sales Line";
                    ElementExists: Boolean;
                    DictionaryOfGroups: Dictionary of [Code[10], Decimal];
                    i: Integer;
                    SalesLine: Record "Sales Line";
                    DictionaryKey: Code[10];
                    GroupMessage: Text[500];
                begin
                    Clear(DictionaryOfGroups);
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    SalesLine.SetRange("Document No.", Rec."Document No.");
                    if SalesLine.FindSet() then
                    repeat
                        ElementExists := false;
                        if (SalesLine."PEG Group" <> '') then begin
                            for i := 1 to DictionaryOfGroups.Count do begin
                                if DictionaryOfGroups.ContainsKey(SalesLine."PEG Group") then begin
                                    ElementExists := true;
                                end;
                            end;

                            if (ElementExists = false) then begin
                                DictionaryOfGroups.Add(SalesLine."PEG Group", SalesLine.Amount);
                            end else begin
                                DictionaryOfGroups.Set(SalesLine."PEG Group", DictionaryOfGroups.Get(SalesLine."PEG Group") + SalesLine.Amount);
                            end;;
                        end;
                    until SalesLine.Next = 0;
                    GroupMessage := '';
                    foreach DictionaryKey in DictionaryOfGroups.Keys do begin
                        GroupMessage += StrSubstNo('%1: %2\', DictionaryKey, DictionaryOfGroups.Get(DictionaryKey));
                    end;
                    Message(GroupMessage);
                end;
            }

            action("Turn grouping")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if ShowGroupColumn = true then begin
                        ShowGroupColumn := false;
                    end else begin
                        ShowGroupColumn := true;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Message('Hello23');
    end;

    trigger OnOpenPage()
    begin
        ShowGroupColumn := Rec."PEG Group Toggle";
    end;

    var
        ShowGroupColumn: Boolean;
}


