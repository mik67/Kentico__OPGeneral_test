pageextension 80024 PurchInvCardExt extends "Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Invoice No.")
        {
            field("Applies-to Doc. Type"; "Applies-to Doc. Type")
            {

            }
            field("Applies-to Doc. No."; "Applies-to Doc. No.")
            {

            }
            field("Applies-to ID"; "Applies-to ID")
            {

            }
            field(VATRegNo; "VAT Registration No.")
            {

            }
        }
        addlast(General)
        {
            field("Paid by Employee"; "Paid by Employee")
            {
                ToolTipML = CSY = 'Pokud je toto pole vyplněno, závazek bude při účtování automaticky přenesen z položek dodavatele do položek zvoleného zaměstnance.';
            }
        }
        modify("Posting Desc. Code")
        {
            Importance = Additional;
        }
        modify("Buy-from Vendor No.")
        {
            Importance = Promoted;
        }
        modify(Status)
        {
            Importance = Promoted;
        }
        modify("Buy-from Contact")
        {
            Importance = Standard;
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
        modify(Reopen)
        {
            ShortcutKey = 'Ctrl+Z';
        }
    }

    var
        myInt: Integer;
}