codeunit 50100 "PEG Turn off grouping"
{  
    procedure setShow(var Show: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        ShowGroupColumn := Show;
    end;

    procedure getShow() ReturnValue: Boolean
    var
        SalesHeader: Record "Sales Header";
    begin
        ReturnValue := ShowGroupColumn;
    end;

    var
        ShowGroupColumn: Boolean;
}