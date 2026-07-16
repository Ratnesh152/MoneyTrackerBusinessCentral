table 80112 "MT Loan"
{
    DataClassification = CustomerContent;
    Caption = 'MT Loan';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; OwnerEntraObjectId; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Owner Entra Object Id';
        }
        field(3; LoanName; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Loan Name';
        }
        field(4; LenderName; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Lender Name';
        }
        field(5; LoanType; Enum "MT Loan Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Loan Type';
        }
        field(6; PrincipalAmount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Principal Amount';
            MinValue = 0;
        }
        field(7; InterestRate; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Interest Rate';
            MinValue = 0;
        }
        field(8; TenureMonths; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Tenure (Months)';
            MinValue = 1;
        }
        field(9; EMIAmount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'EMI Amount';
            MinValue = 0;
        }
        field(10; StartDate; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
        }
        field(12; CurrencyCode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Currency Code';
        }
        field(13; SupportsPrepayment; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Supports Prepayment';
            InitValue = false;
        }
        field(14; Status; Enum "MT Loan Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            InitValue = Active;
        }
        field(15; Notes; Text[500])
        {
            DataClassification = CustomerContent;
            Caption = 'Notes';
        }
        field(16; LoanAccountNumber; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Loan Account Number';
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
        // Duplicate Prevention Rule: Owner + Loan Account Number must be unique
        key(UniqueLoan; OwnerEntraObjectId, LoanAccountNumber)
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        if PrincipalAmount <= 0 then
            Error('Principal Amount must be greater than zero.');

        if EMIAmount <= 0 then
            Error('EMI Amount must be greater than zero.');
    end;

    trigger OnModify()
    begin
        if PrincipalAmount <= 0 then
            Error('Principal Amount must be greater than zero.');

        if EMIAmount <= 0 then
            Error('EMI Amount must be greater than zero.');
    end;
}
