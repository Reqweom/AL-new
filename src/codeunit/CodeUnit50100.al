codeunit 50100 "PEG Turn off grouping"
{
    TableNo = "Sales Line";
    trigger OnRun()
    begin
        Message('Hello1');
    end;

    procedure "Turn off grouping"(var SalesLine: Record "Sales Line")
    begin
        Message('Hello');
        // SalesLine."PEG Group Toggle" := false;
    end;
    
    var
        myInt: Integer;
}