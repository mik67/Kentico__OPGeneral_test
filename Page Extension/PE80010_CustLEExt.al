pageextension 80010 CustomerLEExt extends "Customer Ledger Entries"
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
                CaptionML = CSY = 'Neuhrazené/nespárované doklady', ENG = 'Unpaid/unapplied documents';
            }
        }
    }
    var
        myInt: Integer;
}