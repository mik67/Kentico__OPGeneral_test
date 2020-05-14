tableextension 80008 InvPostingBufferExt extends "Invoice Post. Buffer"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Travel Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Číslo tiketu', ENU = 'Travel Order No.';
        }
    }
    
    var
        myInt: Integer;
}