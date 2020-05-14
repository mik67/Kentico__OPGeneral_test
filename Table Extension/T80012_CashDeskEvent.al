tableextension 80012 CashDeskEventExt extends "Cash Desk Event"
{
    fields
    {
        // Add changes to table fields here¨
        field(80001; "Alternative Posting Group"; Code[20])
        {
            CaptionML = ENU = 'Alternative Posting Group', CSY = 'Alternativní účto skupina';
            TableRelation = IF ("Account Type" = CONST(Customer)) "Customer Posting Group"
            ELSE
            IF ("Account Type" = CONST(Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "FA Posting Group"
            ELSE
            IF ("Account Type" = CONST("Employee")) "Employee Posting Group";
            Editable = true;
        }
        field(80002; "Prepayment Type"; Option)
        {
            CaptionML = ENU = 'Prepayment Type',
                        CSY = 'Typ platby předem/zálohy';
            OptionMembers = " ",Prepayment,Advance;
            OptionCaptionML = CSY = ' ,Platba předem,Záloha', ENU = ' ,Prepayment,Advance';
        }
    }
    
    var
        myInt: Integer;
}