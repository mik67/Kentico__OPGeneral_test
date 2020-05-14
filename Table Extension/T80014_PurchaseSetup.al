tableextension 80014 "Purchase Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(80014; "Employee Purchase Account"; code[20])
        {
            TableRelation = "G/L Account";
            CaptionML = ENU = 'Employee Purch. Acc. - Vendor',
                        CSY = 'Účet pro interní zúčtování';
        }
        field(80015; "Paid by Emp. - Jnl. Temp. Name"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
            CaptionML = ENU = 'Paid by Emp. - Jnl. Temp. Name',
                        CSY = 'Šablona finančního deníku';
        }

        field(80016; "Paid by Emp. - Jnl. Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Paid by Emp. - Jnl. Temp. Name"));
            CaptionML = ENU = 'Paid by Emp. - Jnl. Batch Name',
                        CSY = 'List finančního deníku';
        }

        field(80017; "Empl. Purch. Acc. - Employee"; Code[20])
        {
            TableRelation = "Employee Posting Group";
            CaptionML = ENU = 'Empl. Purch. Acc. - Employee',
                        CSY = 'Účto skupina zaměstnance';
        }
    }

}