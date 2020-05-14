tableextension 80004 GeneralJournalLineExt extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        modify("Account No.")
        {
            trigger OnAfterValidate()
            var
                Vend: Record Vendor;
            begin
                if "Account Type" = "Account Type"::Vendor then begin
                    if Vend.get("Account No.") then
                        "Alternative Vendor Name" := vend.Name;
                end;
            end;
        }

        //New fields
        field(80000; "Travel Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Číslo tiketu', ENU = 'Travel Order No.';
            Editable = true;
        }
        field(80001; "Alternative Posting Group"; Code[20])
        {
            CaptionML = ENU = 'Alternative Posting Group', CSY = 'Alternativní účto skupina';
            TableRelation = IF ("Account Type" = CONST(Customer)) "Customer Posting Group"
            ELSE
            IF ("Account Type" = CONST(Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "FA Posting Group"
            ELSE
            IF ("Account Type" = CONST("Employee")) "Employee Posting Group"
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) "Customer Posting Group"
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "FA Posting Group"
            else
            IF ("Bal. Account Type" = CONST("Employee")) "Employee Posting Group";
            Editable = true;
        }
        field(80002; "Service Code"; Code[20])
        {
            CaptionML = ENU = 'Service Code',
                        CSY = 'Kód služby';
            TableRelation = "Service Type"."Service Code";
            Editable = true;
        }
        field(80003; "Alternative Vendor Name"; Text[50])
        {
            CaptionML = ENU = 'Alternative Vendor Name',
                        CSY = 'Alt. název dodavatele';
        }
    }

    trigger OnDelete();
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        //Blank out the On Hold when Gen Jnl Line is deleted
        //functionality introduced with Suggest Vendor Payments for unposted documents
        if "Payment Reference" <> '' then begin
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Invoice);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);
            PurchaseHeader.SetRange("No.", "Payment Reference");
            if PurchaseHeader.FindFirst() and (PurchaseHeader."On Hold" = 'UN') then begin
                PurchaseHeader."On Hold" := '';
                PurchaseHeader.Modify()
            end;
        end;
    end;

    var
        myInt: Integer;
}