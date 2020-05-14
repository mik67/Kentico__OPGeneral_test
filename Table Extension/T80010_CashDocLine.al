tableextension 80010 CashDocLineExt extends "Cash Document Line"
{
    fields
    {
        // Add changes to table fields here
        modify("Account No.")
        {
            trigger OnAfterValidate()
            var
                Cust: Record Customer;
                Vend: Record Vendor;
                Empl: Record Employee;
            begin
                case "Account Type" of
                    "account type"::Customer:
                        begin
                            Cust.get("Account No.");
                            if Cust."Customer Posting Group" <> '' then
                                "Alternative Posting Group" := Cust."Customer Posting Group";
                        end;
                    "account type"::Vendor:
                        begin
                            Vend.get("Account No.");
                            if Vend."Vendor Posting Group" <> '' then
                                "Alternative Posting Group" := Vend."Vendor Posting Group";
                        end;
                    "account type"::Employee:
                        begin
                            Empl.get("Account No.");
                            if Empl."Employee Posting Group" <> '' then
                                "Alternative Posting Group" := Empl."Employee Posting Group";
                        end;
                end;
            end;
        }
        modify("Cash Desk Event")
        {
            trigger OnAfterValidate()
            var
                CashDeskEvent: Record "Cash Desk Event";
            begin
                if CashDeskEvent.get("Cash Desk Event") then begin
                    "Prepayment Type" := CashDeskEvent."Prepayment Type";
                    "Alternative Posting Group" := CashDeskEvent."Alternative Posting Group";
                end;
            end;
        }
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
            IF ("Account Type" = CONST("Employee")) "Employee Posting Group";
            Editable = true;
        }
    }

    var
        myInt: Integer;
}