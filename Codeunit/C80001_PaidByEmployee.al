codeunit 80001 "Paid By Employee"
{
    trigger OnRun()
    begin

    end;

    procedure PaidByEmplPayment(var PurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        PurchSetup: Record "Purchases & Payables Setup";
        GenJnlLn: Record "Gen. Journal Line";
        GenJnlPostBatch: Codeunit "Gen. Jnl.-Post Batch";
        DocNo: Code[20];
        LineNo: Integer;
    Begin
        // if PurchHeader."Paid by Employee" = '' then exit;
        PurchHeader.CalcFields("Amount Including VAT");
        if PurchHeader."Amount Including VAT" = 0 then exit;
        DocNo := GetNextPINo(PurchHeader);
        PurchSetup.Get();
        GenJnlLn.SetRange("Journal Template Name", PurchSetup."Paid by Emp. - Jnl. Temp. Name");
        GenJnlLn.SetRange("Journal Batch Name", PurchSetup."Paid by Emp. - Jnl. Batch Name");
        if GenJnlLn.FindLast() then
            LineNo := GenJnlLn."Line No." + 10000
        else
            LineNo := 10000;
        InsertPmtJnlLineFromPH(PurchHeader, GenJnlLn
            , PurchSetup."Paid by Emp. - Jnl. Temp. Name"
            , PurchSetup."Paid by Emp. - Jnl. Batch Name"
            , PurchSetup."Employee Purchase Account"
            , LineNo, DocNo);
        GenJnlPostBatch.Run(GenJnlLn);
        Lineno += 10000;
        InsertReInvJnlFromPH(PurchHeader, GenJnlLn
            , PurchSetup."Paid by Emp. - Jnl. Temp. Name"
            , PurchSetup."Paid by Emp. - Jnl. Batch Name"
            , PurchSetup."Employee Purchase Account"
            , PurchSetup."Empl. Purch. Acc. - Employee"
            , LineNo, DocNo);
        GenJnlPostBatch.Run(GenJnlLn);
        PurchHeader."Applies-to Doc. Type" := PurchHeader."Applies-to Doc. Type"::Payment;
        PurchHeader."Applies-to Doc. No." := DocNo;
        // PurchHeader."Applies-to ID" :=
        PurchHeader."On Hold" := 'UZ';
        PurchHeader.Modify();
        // Commit();
    End;

    local procedure InsertPmtJnlLineFromPH(var PurchHeader: Record "Purchase Header"; var PmtJnlLn: Record "Gen. Journal Line"; JnlTmpNme: code[10]; JnlBatNme: Code[10]; EmpPurchAccVend: Code[20]; LineNo: Integer; DocNo: Code[20])
    var
        GenJnlTempl: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        Vendor: Record Vendor;
        GenJnlLine: Record "Gen. Journal Line";
    begin
        vendor.get(PurchHeader."Buy-from Vendor No.");
        GenJnlTempl.get(JnlTmpNme);
        GenJnlBatch.get(JnlTmpNme, JnlBatNme);
        with PmtJnlLn do begin
            init;
            "Journal Template Name" := JnlTmpNme;
            "Journal Batch Name" := JnlBatNme;
            "Line No." := LineNo;
            "Document Type" := "Document Type"::Payment;
            "Posting No. Series" := GenJnlBatch."Posting No. Series";
            validate("Posting Date", PurchHeader."Posting Date");
            // "Document No." := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", "Posting Date");
            "Document No." := DocNo; //PurchHeader."No.";
            "Currency Code" := PurchHeader."Currency Code";
            "Account Type" := "Account Type"::Vendor;
            SetHideValidation(true);
            Validate("Account No.", Vendor."No.");
            "Bal. Account Type" := "Bal. Account Type"::"G/L Account";
            Validate("Bal. Account No.", EmpPurchAccVend);
            Validate("Posting Group", Vendor."Vendor Posting Group");
            "Message to Recipient" := StrSubstNo(MessageToRecipientMsg, PurchHeader."Document Type", PurchHeader."No.");
            // "Bank Payment Type" :=
            Description := StrSubstNo(Text50001, DocNo);
            "Shortcut Dimension 1 Code" := PurchHeader."Shortcut Dimension 1 Code";
            "Shortcut Dimension 2 Code" := PurchHeader."Shortcut Dimension 2 Code";
            "Dimension Set ID" := PurchHeader."Dimension Set ID";
            "Source Code" := GenJnlTempl."Source Code";
            "Reason Code" := GenJnlBatch."Reason Code";
            validate(Amount, PurchHeader."Amount Including VAT");
            "Payment Method Code" := PurchHeader."Payment Method Code";
            "Creditor No." := PurchHeader."Creditor No.";
            "Payment Reference" := PurchHeader."No.";
            "Applies-to Ext. Doc. No." := "Applies-to Ext. Doc. No.";
            // OnBeforeUpdateGnlJnlLineDimensionsFromTempBuffer(GenJnlLine, TempPaymentBuffer);
            // UpdateDimensions(GenJnlLine);
            insert;
        end;
    end;

    local procedure InsertReInvJnlFromPH(var PurchHeader: Record "Purchase Header"; var ReInvJnlLn: Record "Gen. Journal Line"; JnlTmpNme: code[10]; JnlBatNme: Code[10]; EmpPurchAccVend: Code[20]; EmpPostGrpCode: Code[20]; LineNo: Integer; DocNo: Code[20])
    var
        GenJnlTempl: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        Vendor: Record Vendor;
        Employee: Record Employee;
        EmpPostGrp: Record "Employee Posting Group";
        GenJnlLine: Record "Gen. Journal Line";
    begin
        vendor.get(PurchHeader."Buy-from Vendor No.");
        Employee.get(PurchHeader."Paid by Employee");
        EmpPostGrp.get(EmpPostGrpCode);
        GenJnlTempl.get(JnlTmpNme);
        GenJnlBatch.get(JnlTmpNme, JnlBatNme);
        with ReInvJnlLn do begin
            init;
            "Journal Template Name" := JnlTmpNme;
            "Journal Batch Name" := JnlBatNme;
            "Line No." := LineNo;
            "Document Type" := "Document Type"::" ";
            "Posting No. Series" := GenJnlBatch."Posting No. Series";
            validate("Posting Date", PurchHeader."Posting Date");
            // "Document No." := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", "Posting Date");
            "Document No." := DocNo;    //PurchHeader."No.";
            "Currency Code" := PurchHeader."Currency Code";
            "Account Type" := "Account Type"::"G/L Account";
            SetHideValidation(true);
            Validate("Account No.", EmpPurchAccVend);
            "Bal. Account Type" := "Bal. Account Type"::"G/L Account";
            Validate("Bal. Account No.", EmpPostGrp."Payables Account");

            Validate("Posting Group", Employee."Employee Posting Group");
            "Message to Recipient" := StrSubstNo(MessageToRecipientMsg, PurchHeader."Document Type", PurchHeader."No.");
            // "Bank Payment Type" :=
            Description := StrSubstNo(Text50001, DocNo);
            "Shortcut Dimension 1 Code" := PurchHeader."Shortcut Dimension 1 Code";
            "Shortcut Dimension 2 Code" := PurchHeader."Shortcut Dimension 2 Code";
            "Dimension Set ID" := PurchHeader."Dimension Set ID";
            "Source Code" := GenJnlTempl."Source Code";
            "Reason Code" := GenJnlBatch."Reason Code";
            validate(Amount, PurchHeader."Amount Including VAT");
            "Payment Method Code" := PurchHeader."Payment Method Code";
            "Creditor No." := PurchHeader."Creditor No.";
            "Payment Reference" := PurchHeader."No.";
            "Applies-to Ext. Doc. No." := "Applies-to Ext. Doc. No.";
            // OnBeforeUpdateGnlJnlLineDimensionsFromTempBuffer(GenJnlLine, TempPaymentBuffer);
            // UpdateDimensions(GenJnlLine);
            insert;
        end;
    end;

    local procedure GetNextPINo(PurchHeader: Record "Purchase Header"): Code[20]
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        exit(NoSeriesMgt.GetNextNo(PurchHeader."Posting No. Series", PurchHeader."Posting Date", false));
    end;

    var
        MessageToRecipientMsg: Label 'Payment of %1 %2 ', Comment = '%1 document type, %2 Document No.';
        Text50001: label 'Úhrada zaměstnancem %1.';
}