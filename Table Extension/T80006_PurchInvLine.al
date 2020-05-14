tableextension 80006 PurchInvLineExt extends "Purch. Inv. Line"
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
    }
    
    var
        myInt: Integer;
}