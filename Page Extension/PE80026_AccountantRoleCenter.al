pageextension 80026 PageExtension50023 extends "Accountant Role Center"
{
    layout
    {
    }
    actions
    {
        moveafter("General Journals"; "Chart of Accounts")
        movefirst(Embedding; Customers)
        addafter(Customers)
        {
            action("Customer Ledger Entries")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Položky zákazníka', ENU = 'Customer Ledger Entries';
                RunObject = page "Customer Ledger Entries";
            }
            action("Sales Invoice List")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Prodejní faktury', ENU = 'Sales Invoices';
                RunObject = page "Sales Invoice List";
            }
            action("Employee Ledger Entries")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Položky zaměstnanců', ENU = 'Employee Ledger Entries';
                RunObject = page "Employee Ledger Entries";
            }
        }
        moveafter("Customer Ledger Entries"; Vendors)
        addafter(Vendors)
        {
            action("Vendor Ledger Entries")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Položky dodavatele', ENU = 'Vendor Ledger Entries';
                RunObject = page "Vendor Ledger Entries";
            }
        }
        moveafter(Intrastat; "Purchase Orders")
        moveafter("Purchase Orders"; "Bank Accounts")
        moveafter("Vendor Ledger Entries"; "Purchase Invoices")
        addafter("VAT Statements")
        {
            action("VAT Control Report List")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Kontrolní hlášení DPH', ENU = 'VAT Control Reports';
                RunObject = page "VAT Control Report List";
            }
            action("VIES Declarations")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Souhrnná hlášení', ENU = 'VIES Declarations';
                RunObject = page "VIES Declarations";
            }
        }
        moveafter("VIES Declarations"; "VAT Returns")
        addafter("VAT Returns")
        {
            action("Purchase Advance Letters")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Nákupní zálohové faktury', ENU = 'Purchase Advance Letters';
                RunObject = page "Purchase Advance Letters";
            }
            action("Sales Advance Letters")
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Prodejní zálohové faktury', ENU = 'Sales Advance Letters';
                RunObject = page "Sales Advance Letters";
            }
        }
        modify(Analysis)
        {
            Visible = false;
        }
        modify("P&ost Inventory Cost to G/L")
        {
            Visible = false;
        }
        modify("Intrastat &Journal")
        {
            Visible = false;
        }
        modify(Create)
        {
            Visible = false;
        }
    }
}
