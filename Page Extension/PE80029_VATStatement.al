pageextension 80029 VATStatementExt extends "VAT Statement"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Calc. and Post VAT Settlement")
        {
            action(CalcAndPostOP)
            {
                ApplicationArea = VAT;
                CaptionML = ENU = 'OP Calculate and Post VAT Settlement', CSY = 'Vypočítat a účtovat vyrovnání DPH - OP';
                Ellipsis = true;
                Image = SettleOpenTransactions;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "OP Calc. and Post VAT Stlmt.";
                ToolTipML = ENU = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account.',
                            CSY = 'Zavřít otevřené položky DPH a přesunout částky nákupních a prodejních DPH na účet vyrovnání DPH.';
            }
        }
        modify("Calc. and Post VAT Settlement")
        {
            Visible = false;
        }
    }

    var

}