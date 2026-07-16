page 80113 "MT Loans API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'loan';
    EntitySetName = 'loans';
    SourceTable = "MT Loan";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId) { }
                field(entryNo; Rec.EntryNo) { }
                field(ownerEntraObjectId; Rec.OwnerEntraObjectId) { }
                field(loanName; Rec.LoanName) { }
                field(lenderName; Rec.LenderName) { }
                field(loanType; Rec.LoanType) { }
                field(principalAmount; Rec.PrincipalAmount) { }
                field(interestRate; Rec.InterestRate) { }
                field(tenureMonths; Rec.TenureMonths) { }
                field(emiAmount; Rec.EMIAmount) { }
                field(startDate; Rec.StartDate) { }
                field(loanAccountNumber; Rec.LoanAccountNumber) { }
                field(currencyCode; Rec.CurrencyCode) { }
                field(supportsPrepayment; Rec.SupportsPrepayment) { }
                field(status; Rec.Status) { }
                field(notes; Rec.Notes) { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}
