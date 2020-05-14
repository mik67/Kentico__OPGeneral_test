tableextension 500021 "Sales Line Ext." extends "Sales Line"
{
    trigger OnAfterModify()
    var
        SalesHeaderL: Record "Sales Header";
    begin
        if SalesHeaderL.Get("Document Type","Document No.") then begin
            SalesHeaderL."Last Modified By" := UserId;
            SalesHeaderL.Modify();
        end;
    end;
}