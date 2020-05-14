pageextension 80039 SalesCrMemoExt extends "Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify(CopyDocument)
        {
            ShortcutKey = 'Alt+K';
        }
    }

    var
        myInt: Integer;
}