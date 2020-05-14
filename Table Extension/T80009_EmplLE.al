tableextension 80009 EmployeeLEExt extends "Employee Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(80000; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Poznámka', ENU = 'Comment';
        }
        field(80001; "Travel Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Číslo tiketu', ENU = 'Travel Order No.';
            Editable = true;
        }
    }
    
    var
        myInt: Integer;
}