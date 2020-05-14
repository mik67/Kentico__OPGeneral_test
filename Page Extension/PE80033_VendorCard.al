pageextension 80033 VendorCardExt extends "Vendor Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            field(RegNo; "Registration No.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the registration number of vendor.';

                trigger OnDrillDown()
                var
                    RegistrationLogMgt: Codeunit "Registration Log Mgt.";
                begin
                    // NAVCZ
                    CurrPage.SaveRecord;
                    RegistrationLogMgt.AssistEditVendorRegNo(Rec);
                    CurrPage.Update(false);
                    // NAVCZ
                end;
            }
            field(VATRegNo; "VAT Registration No.")
            {
                ApplicationArea = VAT;
                ToolTip = 'Specifies the vendor''s VAT registration number.';

                trigger OnDrillDown()
                var
                    VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                begin
                    VATRegistrationLogMgt.AssistEditVendorVATReg(Rec);
                end;
            }
        }
        modify("Registration No.")
        {
            Visible = false;
        }
        modify("VAT Registration No.")
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}