tableextension 80011 PostedCashDocLineExt extends "Posted Cash Document Line"
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