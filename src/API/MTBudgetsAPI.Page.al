namespace MoneyTrackerPro.Foundation;

page 80107 "MT Budgets API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'budget';
    EntitySetName = 'budgets';
    SourceTable = "MT Budget";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(systemId; Rec.SystemId) { }
                field(entryNo; Rec."Entry No.") { }
                field(ownerEntraObjectId; Rec."Owner Entra Object Id") { }
                field(categoryId; Rec."Category Id") { }
                field(budgetMonth; Rec."Budget Month") { }
                field(budgetYear; Rec."Budget Year") { }
                field(budgetAmount; Rec."Budget Amount") { }
                field(notes; Rec.Notes) { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}
