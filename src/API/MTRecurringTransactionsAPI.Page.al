namespace MoneyTrackerPro.Foundation;

page 80116 "MT Recurring Trans. API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'recurringTransaction';
    EntitySetName = 'recurringTransactions';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "MT Recurring Transaction";
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
                field(transactionType; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field(accountId; Rec."Account Id")
                {
                    ApplicationArea = All;
                }
                field(accountCode; Rec."Account Code")
                {
                    ApplicationArea = All;
                }
                field(categoryId; Rec."Category Id")
                {
                    ApplicationArea = All;
                }
                field(categoryCode; Rec."Category Code")
                {
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(startDate; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field(endDate; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field(frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                }
                field(interval; Rec.Interval)
                {
                    ApplicationArea = All;
                }
                field(nextRunDate; Rec."Next Run Date")
                {
                    ApplicationArea = All;
                }
                field(autoGenerate; Rec."Auto Generate")
                {
                    ApplicationArea = All;
                }
                field(active; Rec.Active)
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
