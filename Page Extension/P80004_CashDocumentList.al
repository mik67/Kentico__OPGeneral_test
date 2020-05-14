pageextension 80004 "Cash Doc List Extension" extends "Cash Document List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("P&ost")
        {
            action(PostBatch)
            {
                ApplicationArea = All;
                CaptionML = CSY = 'Účtovat dávku...', ENU = 'Post Batch...';
                Image = PostBatch;

                trigger OnAction()
                var
                    CashDocHeader: Record "Cash Document Header";
                begin
                    if Confirm('Opravdu chcete zaúčtovat označené záznamy?') then begin
                        CurrPage.SetSelectionFilter(CashDocHeader);
                        if CashDocHeader.Findset then
                            repeat
                                codeunit.run(codeunit::"Cash Document-Post", CashDocHeader);
                                currpage.Update(false);
                            until CashDocHeader.Next() = 0;

                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
}