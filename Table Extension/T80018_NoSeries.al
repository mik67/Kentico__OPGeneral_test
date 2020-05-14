tableextension 80018 NoSeriesExt extends "No. Series"
{
    fields
    {
        // Add changes to table fields here
        field(80000; "Alternative Vendor Post. Group"; Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
            CaptionML = CSY = 'Alternativní účto. sk. dodavatele', ENU = 'Alternative Vendor Post. Group';
        }

        field(80001; "Alternative Customer Post. Group"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
            CaptionML = CSY = 'Alternativní účto. sk. zákazníka', ENU = 'Alternative Customer Post. Group';
        }
    }
    
    var
        myInt: Integer;
}