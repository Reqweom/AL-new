pageextension 50101 "PEG Sales Quote" extends "Sales Quote"
{
    layout
    {
        addfirst(Control105)
        {
            field("PEG Group Toggle";Rec."PEG Group Toggle")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    CurrPage.SalesLines.Page.PEGSetIsGrouping(Rec."PEG Group Toggle");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.SalesLines.Page.PEGSetIsGrouping(Rec."PEG Group Toggle");
    end;
}