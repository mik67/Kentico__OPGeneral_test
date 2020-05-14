pageextension 80040 EmployeeListExt extends "Employee List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Job Title")
        {
            field(Balance; Balance)
            {

            }
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify("Search Name")
        {
            Visible = false;
        }
        modify(Comment)
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