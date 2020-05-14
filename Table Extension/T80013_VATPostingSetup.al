tableextension 80013 VATPostingSetupExt extends "VAT Posting Setup"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Commodity Code"; Code[10])
        {
            TableRelation = Commodity;
            CaptionML = ENU = 'Commodity Code',
                        CSY = 'Kód komodity';
        }
    }

    var
        myInt: Integer;
}