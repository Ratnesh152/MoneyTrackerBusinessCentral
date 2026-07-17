namespace MoneyTrackerPro.Foundation;

page 80117 "MT Recurring Execs. API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'recurringExecution';
    EntitySetName = 'recurringExecutions';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "MT Recurring Execution";
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
                field(recurringTransactionSystemId; Rec."Recurring Trans. System Id")
                {
                    ApplicationArea = All;
                }
                field(generatedTransactionSystemId; Rec."Generated Trans. System Id")
                {
                    ApplicationArea = All;
                }
                field(scheduledDate; Rec."Scheduled Date")
                {
                    ApplicationArea = All;
                }
                field(generatedDateTime; Rec."Generated Date Time")
                {
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(errorMessage; Rec."Error Message")
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
