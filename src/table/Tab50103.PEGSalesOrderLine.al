// tableextension 50103 "PEG Sales Order Line Extension" extends "Sales Line"
// {
//     fields
//     {

//         field(50001; "PEG Einzel EK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Einzel EK';
//         }

//         field(50013; "PEG Einzel VK Toggle"; Boolean)
//         {
//             DataClassification = ToBeClassified;
            
//             trigger OnValidate()
//             begin end;
//         }

//         field(50002; "PEG Einzel VK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Einzel VK';
//         }

//         field(50003; "PEG Montage"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Montage';
//         }

//         field(50004; "PEG EK Montage"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'EK Montage';
//         }

//         field(50005; "PEG VK Montage"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'VK Montage';
//         }

//         field(50006; "PEG ∑ Material EK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = '∑ Material EK';
//         }

//         field(50007; "PEG ∑ Material VK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = '∑ Material VK';
//         }

//         field(50008; "PEG ∑ Montage EK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = '∑ Montage EK';
//         }

//         field(50009; "PEG ∑ Montage VK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = '∑ Montage VK';
//         }

//         field(50010; "PEG Gesamt EK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Gesamt EK';
//         }

//         field(50011; "PEG Gesamt VK"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Gesamt VK';
//         }

//         field(50012; "PEG Marge"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             DecimalPlaces = 0 : 2;
//             Caption = 'Marge';
//         }
//     }
// }