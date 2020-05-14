pageextension 80037 PurchCrMemoCardExt extends "Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
        modify("Copy Document")
        {
            ShortcutKey = 'Alt+K';
        }
    }
    
    var
        myInt: Integer;
}