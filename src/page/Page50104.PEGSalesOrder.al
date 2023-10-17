pageextension 50104 "PEG Sales Order Extension" extends "Sales Order"
{
    layout
    {
        addafter(SalesLines)
        {
            group("Construction-specific")
            {
                field("Gewicht aller Positionen"; TotalWeight)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Dauer in Stunden"; DurationInHours)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Stundensatz Verkauf"; HourlyRateForSales)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Marge Pro Stunde"; SalesTotalForInstallation)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                group("Einkauf")
                {
                    field("PEG Material EK"; MaterialEK)
                    {
                        Caption = 'Material';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Montage EK"; MontageEK)
                    {
                        Caption = 'Montage';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Gesamt EK"; GesamtEK)
                    {
                        Caption = 'Gesamt';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }
                }

                group("Verkauf")
                {
                    field("PEG Material VK"; MaterialVK)
                    {
                        Caption = 'Material';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Montage VK"; MontageVK)
                    {
                        Caption = 'Montage';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Gesamt VK"; GesamtVK)
                    {
                        Caption = 'Gesamt';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }
                }

                group(Marge)
                {
                    field("PEG Material Marge"; MaterialMarge)
                    {
                        Caption = 'Material €';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Material Marge Percent"; MaterialMargePercent)
                    {
                        Caption = 'Material %';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                        AutoFormatType = 10;
                        AutoFormatExpression = '<precision, 1:1><standard format,0>%';
                    }

                    field("PEG Montage Marge"; MontageMarge)
                    {
                        Caption = 'Montage €';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field("PEG Montage Marge Percent"; MontageMargePercent)
                    {
                        Caption = 'Montage %';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                        AutoFormatType = 10;
                        AutoFormatExpression = '<precision, 1:1><standard format,0>%';
                    }

                    field("PEG Gesamt Marge"; GesamtMarge)
                    {
                        Caption = 'Gesamt €';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                    }

                    field("PEG Gesamt Marge Percent"; GesamtMargePercent)
                    {
                        Caption = 'Gesamt %';
                        DecimalPlaces = 0 : 2;
                        ApplicationArea = All;
                        Editable = false;
                        AutoFormatType = 10;
                        AutoFormatExpression = '<precision, 1:1><standard format,0>%';
                    }
                }


            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        MaterialEK: Decimal;
        MontageEK: Decimal;
        GesamtEK: Decimal;
        MaterialVK: Decimal;
        MontageVK: Decimal;
        GesamtVK: Decimal;
        MaterialMarge: Decimal;
        MaterialMargePercent: Decimal;
        MontageMarge: Decimal;
        MontageMargePercent: Decimal;
        GesamtMarge: Decimal;
        GesamtMargePercent: Decimal;
        TotalWeight: Decimal;
        DurationInHours: Decimal;
        HourlyRateForSales: Decimal;
        SalesTotalForInstallation: Decimal;
}