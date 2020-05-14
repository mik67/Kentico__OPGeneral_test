tableextension 80005 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Travel Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Číslo tiketu', ENU = 'Travel Order No.';
            Editable = true;
        }
        field(80002; "Service Code"; Code[20])
        {
            CaptionML = ENU = 'Service Code',
                        CSY = 'Kód služby';
            TableRelation = "Service Type"."Service Code";
            Editable = true;
        }
    }

    trigger OnAfterModify()
    var
        PurchHeaderL: Record "Purchase Header";
    begin
        if PurchHeaderL.Get("Document Type","Document No.") then begin
            PurchHeaderL."Last Modified By" := UserId;
            PurchHeaderL.Modify();
        end;
    end;

    var
        myInt: Integer;

}