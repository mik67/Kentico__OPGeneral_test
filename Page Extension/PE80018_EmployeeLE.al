pageextension 80018 EmployeeLEExt extends "Employee Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field(Comment; Comment)
            {
                Editable = true;
            }
            field("Travel Order No."; "Travel Order No.")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    views
    {
        addfirst
        {
            view(Unpaid)
            {
                Filters = where(Open = const(true));
                OrderBy = ascending("Entry No.");
                SharedLayout = true;
                Visible = true;
                CaptionML = CSY = 'Neuhrazeno', ENG = 'Unpaid';
            }
        }

    }
    var
        myInt: Integer;
}