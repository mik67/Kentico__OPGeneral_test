tableextension 80020 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                NoSeries: Record "No. Series";
            begin
                if NoSeries.Get("No. Series") and (NoSeries."Alternative Customer Post. Group" <> '') then
                    validate("Customer Posting Group", NoSeries."Alternative Customer Post. Group");
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
}