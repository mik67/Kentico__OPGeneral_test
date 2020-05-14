pageextension 80008 PurchCrMemoListExt extends "Purchase Credit Memos"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Cr. Memo No.")
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
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}