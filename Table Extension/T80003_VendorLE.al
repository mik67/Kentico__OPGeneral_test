tableextension 80003 VendorLEExt extends "Vendor Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(80000; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Poznámka', ENU = 'Comment';
        }
    }

    var
        myInt: Integer;
}