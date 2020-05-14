pageextension 80016 PostedPINListExt extends "Posted Purchase Invoices"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Invoice No.")
        {
            field("Original User ID";"Original User ID")
            {

            }
            field("VAT Date";"VAT Date")
            {

            }
            field("Posting Description";"Posting Description")
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