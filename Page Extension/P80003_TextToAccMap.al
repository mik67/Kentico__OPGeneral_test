pageextension 80003 "Text-to-Acc Map Ext" extends "Text-to-Account Mapping"
{
  layout
  {
    // Add changes to page layout here
    modify("Bal. Source No.")
    {
    Editable = true;
    Enabled = true;
    }
  }
  actions
  {
  }
  var myInt: Integer;
}
