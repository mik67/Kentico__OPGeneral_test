tableextension 80002 CustomerLEExt extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(80000;Comment;Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Poznámka', ENU = 'Comment';
        }
    }
    
    var
        myInt: Integer;
}