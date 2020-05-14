codeunit 80000 "OP Even Subscribers"
{
    //TABLES
    [EventSubscriber(ObjectType::Table, 17, 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry.Comment := GenJournalLine.Comment;
        GLEntry."Travel Order No." := GenJournalLine."Travel Order No.";
    end;

    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.Comment := GenJournalLine.Comment;
    end;

    [EventSubscriber(ObjectType::Table, 25, 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry.Comment := GenJournalLine.Comment;
    end;

    [EventSubscriber(ObjectType::Table, 5222, 'OnAfterCopyEmployeeLedgerEntryFromGenJnlLine', '', true, true)]
    procedure OnAfterCopyEmployeeLedgerEntryFromGenJnlLine(var EmployeeLedgerEntry: Record "Employee Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        EmployeeLedgerEntry.Comment := GenJournalLine.Comment;
        EmployeeLedgerEntry."Travel Order No." := GenJournalLine."Travel Order No.";
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnValidateAccountNoOnAfterAssignValue', '', true, true)]
    procedure OnValidateAccountNoOnAfterAssignValue(var GenJournalLine: Record "Gen. Journal Line"; var xGenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Alternative Posting Group" := GenJournalLine."Posting Group";
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnValidateBalAccountNoOnAfterAssignValue', '', true, true)]
    procedure OnValidateBalAccountNoOnAfterAssignValue(var GenJournalLine: Record "Gen. Journal Line"; var xGenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Alternative Posting Group" := GenJournalLine."Posting Group";
    end;

    //CODEUNITS
    [EventSubscriber(ObjectType::Codeunit, 90, 'OnFillInvoicePostBufferOnAfterInitAmounts', '', true, true)]
    procedure OnFillInvoicePostBufferOnAfterInitAmounts(PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; var PurchLineACY: Record "Purchase Line"; var TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary; var InvoicePostBuffer: Record "Invoice Post. Buffer"; var TotalAmount: Decimal; var TotalAmountACY: Decimal)
    begin
        InvoicePostBuffer."Travel Order No." := PurchLine."Travel Order No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostInvPostBuffer', '', true, true)]
    procedure OnBeforePostInvPostBuffer(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer"; var PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean; CommitIsSupressed: Boolean)
    begin
        GenJnlLine."Travel Order No." := InvoicePostBuffer."Travel Order No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, 12, 'OnBeforeStartOrContinuePosting', '', true, true)]
    procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line"; LastDocType: Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder; LastDocNo: Code[20]; LastDate: Date; var NextEntryNo: Integer)
    begin
        if GenJnlLine."Alternative Posting Group" <> '' then
            GenJnlLine."Posting Group" := GenJnlLine."Alternative Posting Group";
    end;

    [EventSubscriber(ObjectType::Codeunit, 12, 'OnBeforeVendLedgEntryInsert', '', true, true)]
    procedure OnBeforeVendLedgEntryInsert(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        if GenJournalLine."Alternative Vendor Name" <> '' then
            VendorLedgerEntry."Vendor Name" := GenJournalLine."Alternative Vendor Name";
    end;


    [EventSubscriber(ObjectType::Codeunit, 12, 'OnAfterVendLedgEntryInsert', '', true, true)]
    procedure OnAfterVendLedgEntryInsert(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        //Set Applies to in released purchase invoice after the payment is posted
        if VendorLedgerEntry."Payment Reference" <> '' then begin
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Invoice);
            PurchaseHeader.SetRange("No.", VendorLedgerEntry."Payment Reference");
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);
            PurchaseHeader.SetRange("On Hold", 'UN');
            if PurchaseHeader.FindFirst() then begin
                PurchaseHeader."Applies-to Doc. Type" := PurchaseHeader."Applies-to Doc. Type"::Payment;
                PurchaseHeader."Applies-to Doc. No." := VendorLedgerEntry."Document No.";
                PurchaseHeader.Modify();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 11735, 'OnAfterInitGenJnlLine', '', true, true)]
    procedure OnAfterInitGenJnlLine(var GenJnlLine: Record "Gen. Journal Line"; CashDocHdr: Record "Cash Document Header"; CashDocLine: Record "Cash Document Line")
    begin
        GenJnlLine."Travel Order No." := CashDocLine."Travel Order No.";
        if CashDocLine."Alternative Posting Group" <> '' then
            GenJnlLine."Posting Group" := CashDocLine."Alternative Posting Group";
    end;

    [EventSubscriber(ObjectType::Codeunit, 11735, 'OnBeforePostedCashDocLineInsert', '', true, true)]
    procedure OnBeforePostedCashDocLineInsert(var PostedCashDocLine: Record "Posted Cash Document Line"; var PostedCashDocHdr: Record "Posted Cash Document Header"; var CashDocLine: Record "Cash Document Line")
    begin
        PostedCashDocLine."Travel Order No." := CashDocLine."Travel Order No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::VATControlReportManagement, 'OnAfterCopyBufferToLine', '', true, true)]
    procedure OnAfterCopyBufferToLine(TempVATControlReportBuffer: Record "VAT Control Report Buffer" temporary; var VATControlReportLine: Record "VAT Control Report Line")
    var
        VATPostSetup: Record "VAT Posting Setup";
    begin
        if (vatpostsetup.get(VATControlReportLine."VAT Bus. Posting Group", VATControlReportLine."VAT Prod. Posting Group"))
            and (VATPostSetup."Commodity Code" <> '') then
            VATControlReportLine."Commodity Code" := VATPostSetup."Commodity Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', true, true)]
    procedure OnBeforePostPurchaseDoc(var PurchaseHeader: Record "Purchase Header")
    begin
        PaidByEmployeeAdd(PurchaseHeader);
    end;

    local procedure PaidByEmployeeAdd(var PurchaseHeader: Record "Purchase Header")
    var
        PurchHeader: Record "Purchase Header";
        PaidByEmpl: Codeunit "Paid By Employee";
    Begin
        if PurchaseHeader."Paid by Employee" = '' then exit;
        if (PurchaseHeader."Applies-to Doc. Type" <> PurchaseHeader."Applies-to Doc. Type"::" ")
            and (PurchaseHeader."Applies-to Doc. No." <> '') then
            exit;
        PaidByEmpl.PaidByEmplPayment(PurchaseHeader);

    End;

    [EventSubscriber(ObjectType::Codeunit, 415, 'OnBeforeManualReleasePurchaseDoc', '', true, true)]
    procedure OnBeforeManualReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
    begin
        if PurchaseHeader."Incoming Document Entry No." = 0 then
            error('K dokladu nebyla přiložena příloha, není možné jej vydat.');
    end;

    [EventSubscriber(ObjectType::Codeunit, 91, 'OnBeforeConfirmPost', '', true, true)]
    procedure OnBeforeConfirmPost(var PurchaseHeader: Record "Purchase Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer)
    var
        UserSetup: Record "User Setup";

    begin
        if UserSetup.get(UserId) and (UserSetup."Block Purchase Posting") then
            Error('Nemáte právo účtovat nákupní doklady. Pro přidělení práv kontaktujte administrátora.');
    end;

    [EventSubscriber(ObjectType::Codeunit, 81, 'OnBeforeConfirmSalesPost', '', true, true)]
    procedure OnBeforeConfirmSalesPost(var SalesHeader: Record "Sales Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer; var PostAndSend: Boolean)
    var
        UserSetup: Record "User Setup";

    begin
        if UserSetup.get(UserId) and (UserSetup."Block Sales Posting") then
            Error('Nemáte právo účtovat prodejní doklady. Pro přidělení práv kontaktujte administrátora.');
    end;


    //PAGES
    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterFindRecords', '', true, true)]
    procedure OnAfterFindRecords(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        PurchHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        GenJnlLine: Record "Gen. Journal Line";
        EntryNo: Integer;
    begin
        //Search for unposted documents using Navigate feature
        //Purchase Invoice
        PurchHeader.Reset;
        PurchHeader.SetFilter("No.", DocNoFilter);
        if PostingDateFilter <> '' then
            PurchHeader.SetFilter("Posting Date", PostingDateFilter);
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Invoice);
        if PurchHeader.FindSet() then begin
            if DocumentEntry.FindLast() then
                EntryNo := DocumentEntry."Entry No." + 1
            else
                EntryNo := 1;
            DocumentEntry.init;
            DocumentEntry."Entry No." := EntryNo;
            DocumentEntry."Table ID" := 38;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::Invoice;
            DocumentEntry."Table Name" := CopyStr('Nákupní faktura', 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := PurchHeader.Count;
            DocumentEntry.Insert;
        end;

        //Purchase CR Memo
        PurchHeader.Reset;
        PurchHeader.SetFilter("No.", DocNoFilter);
        if PostingDateFilter <> '' then
            PurchHeader.SetFilter("Posting Date", PostingDateFilter);
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::"Credit Memo");
        if PurchHeader.FindSet() then begin
            if DocumentEntry.FindLast() then
                EntryNo := DocumentEntry."Entry No." + 1
            else
                EntryNo := 1;
            DocumentEntry.init;
            DocumentEntry."Entry No." := EntryNo;
            DocumentEntry."Table ID" := 38;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::Invoice;
            DocumentEntry."Table Name" := CopyStr('Nákupní dobropis', 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := PurchHeader.Count;
            DocumentEntry.Insert;
        end;

        //Sales Invoice
        SalesHeader.Reset;
        SalesHeader.SetFilter("No.", DocNoFilter);
        if PostingDateFilter <> '' then
            SalesHeader.SetFilter("Posting Date", PostingDateFilter);
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
        if SalesHeader.FindSet() then begin
            if DocumentEntry.FindLast() then
                EntryNo := DocumentEntry."Entry No." + 1
            else
                EntryNo := 1;
            DocumentEntry.init;
            DocumentEntry."Entry No." := EntryNo;
            DocumentEntry."Table ID" := 36;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::Invoice;
            DocumentEntry."Table Name" := CopyStr('Prodejní faktura', 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := SalesHeader.Count;
            DocumentEntry.Insert;
        end;

        //Sales CR Memo
        SalesHeader.Reset;
        SalesHeader.SetFilter("No.", DocNoFilter);
        if PostingDateFilter <> '' then
            SalesHeader.SetFilter("Posting Date", PostingDateFilter);
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Credit Memo");
        if SalesHeader.FindSet() then begin
            if DocumentEntry.FindLast() then
                EntryNo := DocumentEntry."Entry No." + 1
            else
                EntryNo := 1;
            DocumentEntry.init;
            DocumentEntry."Entry No." := EntryNo;
            DocumentEntry."Table ID" := 36;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::Invoice;
            DocumentEntry."Table Name" := CopyStr('Prodejní dobropis', 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := SalesHeader.Count;
            DocumentEntry.Insert;
        end;

        //General Journal Lines
        GenJnlLine.reset;
        GenJnlLine.setfilter("Document No.", DocNoFilter);
        if PostingDateFilter <> '' then
            GenJnlLine.SetFilter("Posting Date", PostingDateFilter);
        if GenJnlLine.FindSet() then begin
            if DocumentEntry.FindLast() then
                EntryNo := DocumentEntry."Entry No." + 1
            else
                EntryNo := 1;
            DocumentEntry.init;
            DocumentEntry."Entry No." := EntryNo;
            DocumentEntry."Table ID" := 81;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::" ";
            DocumentEntry."Table Name" := CopyStr('Řádek deníku', 1, MaxStrLen(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := GenJnlLine.Count;
            DocumentEntry.Insert;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateShowRecords', '', true, true)]
    procedure OnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean; var TempDocumentEntry: Record "Document Entry" temporary; SalesInvoiceHeader: Record "Sales Invoice Header"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; PurchInvHeader: Record "Purch. Inv. Header"; PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; ServiceInvoiceHeader: Record "Service Invoice Header"; ServiceCrMemoHeader: Record "Service Cr.Memo Header")
    var
        PurchHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlTemplate: Record "Gen. Journal Template";
    begin
        //Open unposted documents in Navigate feature
        case TableID of
            DATABASE::"Purchase Header":
                begin
                    PurchHeader.Reset;
                    PurchHeader.SetFilter("No.", DocNoFilter);
                    if PostingDateFilter <> '' then
                        PurchHeader.SetFilter("Posting Date", PostingDateFilter);
                    if PurchHeader.FindSet() then
                        if PurchHeader."Document Type" = PurchHeader."Document Type"::Invoice then
                            if purchheader.Count = 1 then
                                page.Run(PAGE::"Purchase Invoice", PurchHeader)
                            else
                                page.run(PAGE::"Purchase Invoices", PurchHeader)
                        else
                            if purchheader.Count = 1 then
                                PAGE.Run(PAGE::"Purchase Credit Memo", PurchHeader)
                            else
                                PAGE.Run(PAGE::"Purchase Credit Memos", PurchHeader)
                end;
            DATABASE::"Sales Header":
                begin
                    SalesHeader.Reset;
                    SalesHeader.SetFilter("No.", DocNoFilter);
                    if PostingDateFilter <> '' then
                        SalesHeader.SetFilter("Posting Date", PostingDateFilter);
                    if SalesHeader.FindSet() then
                        if SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice then
                            if SalesHeader.Count = 1 then
                                page.Run(PAGE::"Sales Invoice", SalesHeader)
                            else
                                page.run(PAGE::"Sales Invoice List", SalesHeader)
                        else
                            if SalesHeader.Count = 1 then
                                PAGE.Run(PAGE::"Sales Credit Memo", SalesHeader)
                            else
                                PAGE.Run(PAGE::"Sales Credit Memos", SalesHeader)
                end;
            DATABASE::"Gen. Journal Line":
                begin
                    GenJnlLine.reset;
                    GenJnlLine.setfilter("Document No.", DocNoFilter);
                    if PostingDateFilter <> '' then
                        GenJnlLine.SetFilter("Posting Date", PostingDateFilter);
                    if GenJnlLine.FindSet() then begin
                        GenJnlTemplate.reset;
                        GenJnlTemplate.SetRange("Source Code", GenJnlLine."Source Code");
                        if GenJnlTemplate.FindFirst() then
                            case GenJnlTemplate.Type of
                                GenJnlTemplate.Type::General:
                                    Page.Run(PAGE::"General Journal", GenJnlLine);
                                GenJnlTemplate.Type::Payments:
                                    Page.Run(PAGE::"Payment Journal", GenJnlLine);
                                GenJnlTemplate.Type::Assets:
                                    Page.Run(PAGE::"Fixed Asset G/L Journal", GenJnlLine);
                                GenJnlTemplate.Type::"Cash Receipts":
                                    Page.Run(PAGE::"Cash Receipt Journal", GenJnlLine);
                                GenJnlTemplate.Type::Intercompany:
                                    Page.Run(PAGE::"IC General Journal", GenJnlLine);
                                GenJnlTemplate.Type::Purchases:
                                    Page.Run(PAGE::"Purchase Journal", GenJnlLine);
                                GenJnlTemplate.Type::Sales:
                                    Page.Run(PAGE::"Sales Journal", GenJnlLine);
                                GenJnlTemplate.Type::Jobs:
                                    Page.Run(PAGE::"Job Journal", GenJnlLine);
                            end;
                    end;
                end;
        end;
    end;

}