pageextension 80012 PurchInvoiceSubExt extends "Purch. Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Travel Order No."; "Travel Order No.")
            {
                Visible = true;
            }
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = True;
        }
        modify("Tariff No.")
        {
            Visible = true;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}