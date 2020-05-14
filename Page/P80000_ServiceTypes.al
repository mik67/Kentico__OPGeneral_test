page 80000 "Service Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Type";
    CaptionML = ENU = 'Service Types',
                CSY = 'Typy služeb';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Service Code"; "Service Code")
                {
                    ApplicationArea = All;
                }
                field("Service Description"; "Service Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}