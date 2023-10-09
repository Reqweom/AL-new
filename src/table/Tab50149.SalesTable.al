tableextension 50116 "PEG Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "PEG Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group';
        }

        field(50001; "PEG Group Toggle"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Turn on grouping';
            InitValue = true;

            trigger OnValidate()
            begin end;
        }
    }
}