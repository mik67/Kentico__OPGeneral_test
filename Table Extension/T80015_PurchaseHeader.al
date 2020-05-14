tableextension 80015 "Purchase Header Ext." extends "Purchase Header"
{
    fields
    {
        field(80015; "Paid by Employee"; code[20])
        {
            TableRelation = Employee;
            CaptionML = ENU = 'Paid by Employee',
                        CSY = 'Uhrazeno zaměstnancem';
        }
        modify("Payment Method Code")
        {
            trigger OnAfterValidate()
            var
                PaymentMethods: Record "Payment Method";
            begin
                if PaymentMethods.get("Payment Method Code") and (PaymentMethods."On-Hold Code" <> '') then
                    "On Hold" := PaymentMethods."On-Hold Code";
            end;
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                NoSeries: Record "No. Series";
            begin
                if NoSeries.Get("No. Series") and (NoSeries."Alternative Vendor Post. Group" <> '') then
                    validate("Vendor Posting Group", NoSeries."Alternative Vendor Post. Group");
            end;
        }

        modify("Vendor Invoice No.")
        {
            trigger OnAfterValidate()
            begin


                case "Document Type" of
                    "Document Type"::Invoice:
                        "Variable Symbol" := GetNumericCharFromRight("Vendor Invoice No.", 10);
                    "Document Type"::"Credit Memo":
                        "Variable Symbol" := GetNumericCharFromRight("Vendor Cr. Memo No.", 10);
                    "Document Type"::Order:
                        "Variable Symbol" := GetNumericCharFromRight("Vendor Order No.", 10);
                end;
            end;
        }

        field(80000; "Last Modified By"; Code[50])
        {
            CaptionML = ENU ='Last Modified By', CSY = 'Naposledy upraveno';
        }
    }
    
    trigger OnAfterModify()
    begin
        "Last Modified By" := UserId;
        Modify();
    end;

    local procedure GetNumericCharFromRight(myText: text; LenFromRight: Integer) tmpCode: text
    var
        txtCharsToKeep: text[20];
    begin
        txtCharsToKeep := '0123456789';
        tmpCode := DELCHR(myText, '=', DELCHR(myText, '=', txtCharsToKeep));
        if (LenFromRight > 0) and (StrLen(tmpCode) > LenFromRight) then
            tmpCode := CopyStr(tmpCode, StrLen(tmpCode) - LenFromRight + 1);
    end;

    var
        myInt: Integer;
}