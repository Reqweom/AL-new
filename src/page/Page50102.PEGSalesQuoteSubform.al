pageextension 50102 "PEG Sales Quote Extension" extends "Sales Quote Subform"
{
    layout
    {
        addbefore("Location Code")
        {
            field("PEG Group";Rec."PEG Group")
            {
                Caption = 'Group';
                ApplicationArea = All;
                Visible = IsGrouping;

                trigger OnValidate()
                begin
                    CurrPage.Update(true);
                    CalculateGroups();
                end;
            }
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                CalculateGroups();
            end;
        }

        modify("Line Amount")
        {
            trigger OnAfterValidate()
            begin
                CalculateGroups();
            end;
        }

        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                CalculateGroups();
            end;
        }
        
        addlast(Control1)
        {
            field("PEG Einzel EK";Rec."PEG Einzel EK")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CalculateRows();
                end;
            }

            field("PEG Einzel VK Toggle";Rec."PEG Einzel VK Toggle")
            {
                ApplicationArea = All;
                ShowCaption = false;
            }

            field("PEG Einzel VK";Rec."PEG Einzel VK")
            {
                ApplicationArea = All;
                Editable = not Rec."PEG Einzel VK Toggle";

                trigger OnValidate()
                begin
                    CalculateRows();
                end;
            }

            field("PEG Montage";Rec."PEG Montage")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CalculateRows();
                end;
            }

            field("PEG EK Montage";Rec."PEG EK Montage")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CalculateRows();
                end;
            }

            field("PEG VK Montage";Rec."PEG VK Montage")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CalculateRows();
                end;
            }

            field("PEG ∑ Material EK";Rec."PEG ∑ Material EK")
            {
                ApplicationArea = All;
            }
            
            field("PEG ∑ Material VK";Rec."PEG ∑ Material VK")
            {
                ApplicationArea = All;
            }

            field("PEG ∑ Montage EK";Rec."PEG ∑ Montage EK")
            {
                ApplicationArea = All;
            }

            field("PEG ∑ Montage VK";Rec."PEG ∑ Montage VK")
            {
                ApplicationArea = All;
            }

            field("PEG Gesamt EK";Rec."PEG Gesamt EK")
            {
                ApplicationArea = All;
            }

            field("PEG Gesamt VK";Rec."PEG Gesamt VK")
            {
                ApplicationArea = All;
            }

            field("PEG Marge";Rec."PEG Marge")
            {
                ApplicationArea = All;
                AutoFormatType = 10;
                AutoFormatExpression = '<precision, 1:1><standard format,0>%';
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
                begin
                    CalculateGroups();
                end;
            }
        }
    }

    procedure CalculateRows()
    var
        Table: Record "Sales Line";
        i: Integer;
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."Document No.");
        if SalesLine.FindSet() then
        repeat
            Rec."PEG ∑ Material EK" := SalesLine.Quantity * SalesLine."PEG Einzel EK";
            Rec."PEG ∑ Material VK" := SalesLine.Quantity * SalesLine."PEG Einzel VK";
            Rec."PEG ∑ Montage EK" := SalesLine.Quantity * SalesLine."PEG EK Montage";
            Rec."PEG ∑ Montage VK" := SalesLine.Quantity * SalesLine."PEG VK Montage";
            Rec."PEG Gesamt EK" := SalesLine."PEG ∑ Material EK" + SalesLine."PEG ∑ Montage EK";
            Rec."PEG Gesamt VK" := SalesLine."PEG ∑ Material VK" + SalesLine."PEG ∑ Montage VK";
            Rec."PEG Marge" := (SalesLine."PEG Gesamt VK" - SalesLine."PEG Gesamt EK") / SalesLine."PEG Gesamt EK";
        until SalesLine.Next = 0;
    end;

    procedure PEGSetIsGrouping(isGroupingTable: Boolean)
    begin
        IsGrouping := isGroupingTable;
        CurrPage.Update(false);
    end;

    procedure CalculateGroups()
    var
        Table: Record "Sales Line";
        ElementExists: Boolean;
        DictionaryOfGroups: Dictionary of [Text[30], Decimal];
        i: Integer;
        SalesLine: Record "Sales Line";
        SalesQuote: Page "Sales Quote";
        DictionaryKey: Text[30];
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
                    DictionaryOfGroups.Add(SalesLine."PEG Group", SalesLine."Line Amount");
                end else begin
                    DictionaryOfGroups.Set(SalesLine."PEG Group", DictionaryOfGroups.Get(SalesLine."PEG Group") + SalesLine."Line Amount");
                end;;
            end;
        until SalesLine.Next = 0;
        SalesQuote.CalculateGroups(DictionaryOfGroups);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CalculateGroups();
        CurrPage.Update(false);
    end;

    var
        IsGrouping: Boolean;
}


