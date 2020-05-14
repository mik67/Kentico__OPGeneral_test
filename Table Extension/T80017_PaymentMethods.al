tableextension 80017 PaymentMethodsExt extends "Payment Method"
{
    fields
    {
        field(80000; "On-Hold Code"; code[3])
        {
            CaptionML = CSY = 'Vyčkat kód', ENU = 'On-Hold Code';
            DataClassification = ToBeClassified;
            Editable = true;
        }
    }

    var
        myInt: Integer;
}