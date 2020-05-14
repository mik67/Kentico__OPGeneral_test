pageextension 80019 CashDocLineSubformExt extends "Cash Document Subform"
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
        addafter(Description)
        {
            field("Travel Order No.";"Travel Order No.")
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