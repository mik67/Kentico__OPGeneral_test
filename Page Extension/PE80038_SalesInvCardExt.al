pageextension 80038 SalesInvCard extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("Due Date")
        {
            field(VATRegNo; "VAT Registration No.")
            {

            }
        }

        modify("VAT Registration No.")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
        modify(CopyDocument)
        {
            ShortcutKey = 'Alt+K';
        }
    }

    var
        myInt: Integer;
}