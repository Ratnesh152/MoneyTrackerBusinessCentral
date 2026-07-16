namespace MoneyTrackerPro.Foundation;

page 80106 "MT Categories API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'category';
    EntitySetName = 'categories';
    SourceTable = "MT Category";
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
                field(code; Rec.Code) { }
                field(name; Rec.Name) { }
                field(transactionType; Rec."Transaction Type") { }
                field(isActive; Rec."Is Active") { }
                field(displayOrder; Rec."Display Order") { }
                field(colorCode; Rec."Color Code") { }
                field(iconName; Rec."Icon Name") { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}
