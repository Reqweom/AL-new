tableextension 50101 "PEG Sales Header Extension" extends "Sales Header"
{
    fields
    {
        field(50000; "PEG Group Toggle"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Turn on grouping';
        }
    }
}