pageextension 80013 PurchCrMemoSubExt extends "Purch. Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Travel Order No."; "Travel Order No.")
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