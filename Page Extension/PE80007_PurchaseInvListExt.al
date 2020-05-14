pageextension 80007 PurchaseInvoiceListExt extends "Purchase Invoices"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Invoice No.")
        {
            field("Original User ID"; "Original User ID")
            {

            }
            field("VAT Date"; "VAT Date")
            {

            }
            field("Posting Description"; "Posting Description")
            {

            }
            field("On Hold"; "On Hold")
            {

            }
        }
        modify("Document Date")
        {
            Visible = true;
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = true;
        }
        addafter(Amount)
        {
            field("Amount Including VAT"; "Amount Including VAT")
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