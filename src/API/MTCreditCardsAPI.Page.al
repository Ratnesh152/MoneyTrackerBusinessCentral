page 80108 "MT Credit Cards API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'creditCard';
    EntitySetName = 'creditCards';
    SourceTable = "MT Credit Card";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(systemId; Rec.SystemId) { ApplicationArea = All; }
                field(entryNo; Rec.EntryNo) { ApplicationArea = All; }
                field(ownerEntraObjectId; Rec.OwnerEntraObjectId) { ApplicationArea = All; }
                field(cardName; Rec.CardName) { ApplicationArea = All; }
                field(issuingBank; Rec.IssuingBank) { ApplicationArea = All; }
                field(cardNetwork; Rec.CardNetwork) { ApplicationArea = All; }
                field(last4Digits; Rec.Last4Digits) { ApplicationArea = All; }
                field(creditLimit; Rec.CreditLimit) { ApplicationArea = All; }
                field(currencyCode; Rec.CurrencyCode) { ApplicationArea = All; }
                field(statementDay; Rec.StatementDay) { ApplicationArea = All; }
                field(dueDay; Rec.DueDay) { ApplicationArea = All; }
                field(interestRate; Rec.InterestRate) { ApplicationArea = All; }
                field(annualFee; Rec.AnnualFee) { ApplicationArea = All; }
                field(supportsEMI; Rec.SupportsEMI) { ApplicationArea = All; }
                field(isActive; Rec.IsActive) { ApplicationArea = All; }
                field(notes; Rec.Notes) { ApplicationArea = All; }
                field(systemCreatedAt; Rec.SystemCreatedAt) { ApplicationArea = All; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { ApplicationArea = All; }
            }
        }
    }
}
