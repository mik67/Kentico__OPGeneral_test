pageextension 80022 VATPostSetupExt extends "VAT Posting Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Tax Category")
        {
            field("Commodity Code"; "Commodity Code")
            {

            }
        }
        addafter("VAT Rate")
        {
            field("Intrastat Service"; "Intrastat Service")
            {

            }
        }
        addafter("Ratio Coefficient")
        {
            field("Supplies Mode Code"; "Supplies Mode Code")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}