pageextension 50102 "PEG Sales Quote Extension" extends "Sales Quote Subform"
{
    layout
    {
        // addbefore(Control1)
        // {
            // field("PEG Group Toggle"; ShowGroupColumn)
            // {
            //     Caption = 'Turn on grouping';
            //     ApplicationArea = All;

            //     trigger OnValidate()
            //     var 
            //         SalesHeader: Record "Sales Header";
            //     begin
            //         SalesHeader.FindSet();
            //         SalesHeader."PEG Group Toggle" := ShowGroupColumn;
            //         CurrPage.Update(false);
            //     end;
            // }
        // }

        addbefore("Location Code")
        {
            field("PEG Group"; Rec."PEG Group")
            {
                Caption = 'Group';
                ApplicationArea = All;
                Visible = IsGrouping;
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
                Visible = IsGrouping;

                trigger OnAction()
                var
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
        }
    }

    procedure PEGSetIsGrouping(isGroupingTable: Boolean)
    begin
        IsGrouping := isGroupingTable;
        CurrPage.Update(false);
    end;

    var
        IsGrouping: Boolean;
}


