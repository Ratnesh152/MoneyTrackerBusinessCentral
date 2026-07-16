page 80115 "MT Loan Payments API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'loanPayment';
    EntitySetName = 'loanPayments';
    SourceTable = "MT Loan Payment";
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
                field(loanSystemId; Rec.LoanSystemId) { }
                field(paymentDate; Rec.PaymentDate) { }
                field(emiNumber; Rec.EMINumber) { }
                field(amountPaid; Rec.AmountPaid) { }
                field(paymentMethod; Rec.PaymentMethod) { }
                field(transactionReference; Rec.TransactionReference) { }
                field(notes; Rec.Notes) { }
                field(status; Rec.Status) { }
                field(systemCreatedAt; Rec.SystemCreatedAt) { }
                field(systemModifiedAt; Rec.SystemModifiedAt) { }
            }
        }
    }
}
