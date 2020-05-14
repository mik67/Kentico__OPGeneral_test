tableextension 80000 VendorExt extends Vendor
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Balance at Date"; Decimal) //1.0.0.14
        {
            CaptionML = CSY = 'Saldo k datu', ENU = 'Balance at Date';
            FieldClass = FlowField;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry".Amount WHERE("Vendor No." = FIELD("No."), "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"), "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"), "Currency Code" = FIELD("Currency Filter"), "Posting Date" = FIELD("Date Filter")));
        }
        field(80001; "Balance at Date (LCY)"; Decimal) //1.0.0.14
        {
            FieldClass = FlowField;
            CalcFormula = - Sum ("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE("Vendor No." = FIELD("No."), "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"), "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"), "Currency Code" = FIELD("Currency Filter"), "Posting Date" = FIELD("Date Filter")));
            CaptionML = CSY = 'Saldo k datu (LM)', ENU = 'Balance at Date (LCY)';
        }
    }

    var
        myInt: Integer;
}