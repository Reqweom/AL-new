tableextension 50102 "PEG Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50000; "PEG Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group';
        }

        field(50020; "PEG GroupTog"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Grouping';
        }
    }
}