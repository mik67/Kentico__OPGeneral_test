tableextension 80019 UserSetupExt extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Block Sales Posting"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Zablokovat účtování prodeje', ENU = 'Block Sales Posting';
        }
        field(80001; "Block Purchase Posting"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Zablokovat účtování nákupu', ENU = 'Block Purchase Posting';
        }
    }

    var
        myInt: Integer;
}