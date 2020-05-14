pageextension 80021 CashDeskEventsExt extends "Cash Desk Events Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Account No.")
        {
            field("Alternative Posting Group";"Alternative Posting Group")
            {

            }
        }
        addafter("Global Dimension 2 Code")
        {
            field("Prepayment Type";"Prepayment Type")
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