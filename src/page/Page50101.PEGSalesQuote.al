pageextension 50101 "PEG Sales Quote" extends "Sales Quote"
{
    layout
    {
        addbefore(SalesLines)
        {
            field("PEG Group Toggle";Rec."PEG Group Toggle")
            {
                ApplicationArea = Basic, Suite;

                trigger OnValidate()
                begin
                    CurrPage.SalesLines.Page.PEGSetIsGrouping(Rec."PEG Group Toggle");
                end;
            }
        }

        addafter(SalesLines)
        {
            part("PEGGroups"; "PEG Groups Page")
            {
                Caption = 'Groups';
                ApplicationArea = Basic, Suite;
                UpdatePropagation = Both;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.SalesLines.Page.PEGSetIsGrouping(Rec."PEG Group Toggle");
    end;

    procedure CalculateGroups(var Groups: Dictionary of [Text[30], Decimal])
    var
        DictionaryKey: Text[30];
        SalesHeader: Record "Sales Header";
    begin
        CurrPage.PEGGroups.Page.PEGSetGroups(Groups);
    end;
}