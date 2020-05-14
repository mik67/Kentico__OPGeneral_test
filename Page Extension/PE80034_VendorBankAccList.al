pageextension 80034 VendorBankAccListExt extends "Vendor Bank Account List"
{
    layout
    {
        // Add changes to page layout here
        modify("Phone No.")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Visible = false;
        }
        modify("Bank Account No.")
        {
            Visible = true;
        }
        modify(IBAN)
        {
            Visible = true;
        }
        modify("SWIFT Code")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}