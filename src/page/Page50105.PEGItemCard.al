pageextension 50105 "PEG Item Card Extension" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("PEG Minutes of Installation";Rec."PEG Minutes of Installation")
            {
                ApplicationArea = All;
            }
        }
    }
}

pageextension 50106 "PEG Items Extension" extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("PEG Minutes of Installation";Rec."PEG Minutes of Installation")
            {
                ApplicationArea = All;
            }
        }
    }
}