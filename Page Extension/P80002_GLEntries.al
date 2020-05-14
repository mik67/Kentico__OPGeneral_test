pageextension 80002 "General Ledger Entries Ext" extends "General Ledger Entries"
{
  layout
  {
    addafter("Source Code")
    {
      field(Comment;Comment)
      {
        Editable = true;
      }
      field("Travel Order No.";"Travel Order No.")
      {
      }
      field("Source Type";"Source Type")
      {
        Editable = true;
      }
      field("Source No.";"Source No.")
      {
        Editable = true;
      }
      field("Source Name";"Source Name")
      {
        Editable = true;
      }
      field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
      {
      }
      field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
      {
      }
    }
  }
  actions
  {
  }
}
