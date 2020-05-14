pageextension 80025 PaymentJournalExt extends "Payment Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Posting Group")
        {
            field("Alternative Posting Group";"Alternative Posting Group")
            {
                
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(SuggestVendorPayments)
        {
            action(SuggestVendorPaymentsOP)
            {
                ApplicationArea = Basic, Suite;
                CaptionML = ENU = 'Suggest Vendor Payments OP', CSY = 'OP Navrhni platby dodavatelům';
                Ellipsis = true;
                Image = SuggestVendorPayments;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Create payment suggestions as lines in the payment journal.';

                trigger OnAction()
                var
                    SuggestVendorPayments: Report "Suggest Vendor Payments OP";
                begin
                    Clear(SuggestVendorPayments);
                    SuggestVendorPayments.SetGenJnlLine(Rec);
                    SuggestVendorPayments.RunModal;
                end;
            }
        }
    }

    var
        myInt: Integer;
}