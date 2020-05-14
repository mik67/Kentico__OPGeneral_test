pageextension 80032 CustomerListExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("Registration No."; "Registration No.")
            {

            }
            field("VAT Registration No."; "VAT Registration No.")
            {

            }
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Visible = false;
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}