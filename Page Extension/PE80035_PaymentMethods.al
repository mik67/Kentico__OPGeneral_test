pageextension 80035 PaymentMethodsExt extends "Payment Methods"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bal. Account No.")
        {
            field("On-Hold Code"; "On-Hold Code")
            {
                ToolTipML = CSY = 'Kód, který bude vyplněn do pole Vyčka v nákupních fakturách.', ENU = 'Code, that will be filled into On-Hold field in Purchase Invoices';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}