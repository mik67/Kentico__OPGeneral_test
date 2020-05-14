pageextension 80005 BankListExt extends "Bank List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Name")
        {
            field(Balance; Balance)
            {
            }

            field("Balance (LCY)"; "Balance (LCY)")
            {
            }

            field("Balance at Date"; "Balance at Date")
            {
            }

            field("Balance at Date (LCY)"; "Balance at Date (LCY)")
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