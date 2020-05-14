pageextension 80036 NoSeriesListExt extends "No. Series"
{
    layout
    {
        // Add changes to page layout here
        addafter(Mask)
        {
            field("Alternative Vendor Post. Group"; "Alternative Vendor Post. Group")
            {
                ToolTipML = CSY = 'Účto skupina dodavatele, která bude použita na nákupní faktuře místo standardní účto skupiny dod.', ENU = 'Posting group that will be used instead of standard vendor posting group.';
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