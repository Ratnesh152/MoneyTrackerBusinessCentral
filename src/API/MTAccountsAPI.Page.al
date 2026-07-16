namespace MoneyTrackerPro.Foundation;

page 80105 "MT Accounts API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'account';
    EntitySetName = 'accounts';
    SourceTable = "MT Account";
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
                field(name; Rec.Name) { }
                field(accountType; Rec."Account Type") { }
                field(openingBalance; Rec."Opening Balance") { }
                field(currencyCode; Rec."Currency Code") { }
                field(isDefault; Rec."Is Default") { }
                field(notes; Rec.Notes) { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}
