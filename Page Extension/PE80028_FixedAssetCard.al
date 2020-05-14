pageextension 80028 FixedAssetCardExt extends "Fixed Asset Card"
{
    layout
    {
        // Add changes to page layout here        
    }

    actions
    {
        // Add changes to page actions here
        modify(Acquire)
        {
            Visible = true;
            Enabled = true;
        }
    }

    var
        myInt: Integer;
}