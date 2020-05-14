pageextension 80009 GeneralJournalExt extends "General Journal"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Country/Region Code"; "Country/Region Code")
            {

            }
            field("Travel Order No."; "Travel Order No.")
            {

            }
        }
        addafter("Bal. Account No.")
        {
            field("Alternative Posting Group"; "Alternative Posting Group")
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