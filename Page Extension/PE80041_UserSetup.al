pageextension 80041 UserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Allow Posting to Closed Period")
        {
            field("Block Sales Posting"; "Block Sales Posting")
            {

            }
            field("Block Purchase Posting"; "Block Purchase Posting")
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