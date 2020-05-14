tableextension 80001 "General Ledger Entries Ext" extends "G/L Entry"
{
    fields
    {
        field(80000; "Source Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Název původu', ENU = 'Source Name';
        }
        field(80001; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Poznámka', ENU = 'Comment';
        }
        field(80002; "Travel Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = CSY = 'Číslo tiketu', ENU = 'Travel Order No.';
            Editable = true;
        }
    }
    var
        Customer: Record Customer;
        Vendor: Record Vendor;

    trigger OnAfterInsert();
    begin
        setSourceName();
    end;

    procedure setSourceName()
    begin
        if "Source Type" = "Source Type"::Customer then begin
            if Customer.get("Source Code") then
                "Source Name" := Customer.Name;
        end;
        if "Source Type" = "Source Type"::Vendor then begin
            if Vendor.get("Source Code") then
                "Source Name" := Vendor.Name;
        end;
    end;

}