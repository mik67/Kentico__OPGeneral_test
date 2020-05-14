table 80000 "Service Type"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"Service Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Service Code',
                        CSY = 'Kód služby';
        }
        field(20;"Service Description"; Text[1024])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Service Description',
                        CSY = 'Popis služby';
        }
    }
    
    keys
    {
        key(PK; "Service Code")
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}