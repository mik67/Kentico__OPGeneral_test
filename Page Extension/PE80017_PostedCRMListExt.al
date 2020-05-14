pageextension 80017 PostedCRMListExt extends "Posted Purchase Credit Memos"
{
    layout
    {
        // Add changes to page layout here
        addafter("Currency Code")
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