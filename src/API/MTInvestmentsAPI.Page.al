namespace MoneyTrackerPro.Foundation;

page 80119 "MT Investments API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'investment';
    EntitySetName = 'investments';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "MT Investment";
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(entryNo; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ownerEntraObjectId; Rec."Owner Entra Object Id")
                {
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(investedAmount; Rec."Invested Amount")
                {
                    ApplicationArea = All;
                }
                field(currentValue; Rec."Current Value")
                {
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(notes; Rec.Notes)
                {
                    ApplicationArea = All;
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
