namespace MoneyTrackerPro.Foundation;

page 80102 "MT Transactions API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'transaction';
    EntitySetName = 'transactions';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "MT Transaction";
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
                field(transactionDate; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                }
                field(transactionType; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
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
                field(subcategoryCode; Rec."Subcategory Code")
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
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field(reference; Rec.Reference)
                {
                    ApplicationArea = All;
                }
                field(notes; Rec.Notes)
                {
                    ApplicationArea = All;
                }
                field(tags; Rec.Tags)
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
