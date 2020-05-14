pageextension 80023 PurchJournalExt extends "Purchase Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("<Vendor Name>")
        {
            field("Alternative Vendor Name"; "Alternative Vendor Name")
            {
                ToolTipML = CSY = 'Název dodavatele promítnutý do položek dodavatele. Toto pole je užito při účtování drobných nákladů na obecného dodavatele.',
                            ENU = 'Vendor name, which is placed in Vendor Ledger Entries upon posting. This field is used for small expenses posted against a generic vendor.';
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