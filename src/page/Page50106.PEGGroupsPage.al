page 50106 "PEG Groups Page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PEG Groups Table";

    layout
    {
        area(Content)
        {
            repeater("PEG Group Table")
            {
                field("PEG Group Name"; Rec."PEG Group Name")
                {
                    ApplicationArea = All;
                }

                field("PEG Group Amount"; Rec."PEG Group Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    procedure PEGSetGroups(var Groups: Dictionary of [Text[30], Decimal])
    var
        GroupName: Text[30];
    begin
        Rec.DeleteAll();
        Rec.Init;
        foreach GroupName in Groups.Keys do begin
            Rec."PEG Group Name" := GroupName;
            Rec."PEG Group Amount" := Groups.Get(GroupName);
            Rec.Insert();
        end;
    end;
    
    var
        GName: Text[30];
        GAmount: Decimal;
}