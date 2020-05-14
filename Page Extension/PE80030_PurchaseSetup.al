pageextension 80030 "Purchase Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter(General)
        {
            group("Úhrada závazku zaměstnancem")
            {
                field("Employee Purch. Acc. - Vendor"; "Employee Purchase Account")
                {
                    ToolTipML = CSY = 'Účet interního zúčtování, který bude použit pro přeúčtování interního závazku.';
                }
                field("Empl. Purch. Acc. - Employee"; "Empl. Purch. Acc. - Employee")
                {
                    ToolTipML = CSY = 'Účto skupina zaměstnance, která bude použita pro přeúčtování úhrady závazku.';
                }
                field("Paid by Emp. - Jnl. Temp. Name"; "Paid by Emp. - Jnl. Temp. Name")
                {
                    ToolTipML = CSY = 'Šablona finančního deníku pro interní přeúčtování závazku na zaměstnance.';
                }
                field("Paid by Emp. - Jnl. Batch Name"; "Paid by Emp. - Jnl. Batch Name")
                {
                    ToolTipML = CSY = 'List finančního deníku pro interní přeúčtování závazku na zaměstnance.';
                }
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