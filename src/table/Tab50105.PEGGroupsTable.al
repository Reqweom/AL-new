table 50105 "PEG Groups Table"
{
    DataClassification = ToBeClassified;
    
    fields
    {

        field(50001; "PEG Group Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group Name';
        }

        field(50002; "PEG Group Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Group Amount';
            DecimalPlaces = 0 : 2;
        }
    }
    
    keys
    {
        key(Group; "PEG Group Name")
        {
            Clustered = true;
        }
    }
}