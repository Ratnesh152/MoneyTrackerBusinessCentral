table 80100 "MT Credit Card"
{
    DataClassification = CustomerContent;
    Caption = 'MT Credit Card';

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
        field(3; CardName; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Card Name';
        }
        field(4; IssuingBank; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Issuing Bank';
        }
        field(5; CardNetwork; Enum "MT Credit Card Network")
        {
            DataClassification = CustomerContent;
            Caption = 'Card Network';
        }
        field(6; Last4Digits; Code[4])
        {
            DataClassification = CustomerContent;
            Caption = 'Last 4 Digits';
            // Simple validation to ensure it's only digits could be added here or kept at frontend
        }
        field(7; CreditLimit; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Credit Limit';
            MinValue = 0;
        }
        field(8; CurrencyCode; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Currency Code';
        }
        field(9; StatementDay; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Statement Day';
            MinValue = 1;
            MaxValue = 31;
        }
        field(10; DueDay; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Day';
            MinValue = 1;
            MaxValue = 31;
        }
        field(11; InterestRate; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Interest Rate';
            MinValue = 0;
        }
        field(12; AnnualFee; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Annual Fee';
            MinValue = 0;
        }
        field(13; SupportsEMI; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Supports EMI';
            InitValue = false;
        }
        field(14; IsActive; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Is Active';
            InitValue = true;
        }
        field(15; Notes; Text[500])
        {
            DataClassification = CustomerContent;
            Caption = 'Notes';
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
        // Duplicate Prevention Rule: Owner + IssuingBank + Last4Digits must be unique
        key(UniqueCard; OwnerEntraObjectId, IssuingBank, Last4Digits)
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        // AL level validation
        if StatementDay = DueDay then
            Error('Statement Day cannot be the same as Due Day.');
    end;

    trigger OnModify()
    begin
        // AL level validation
        if StatementDay = DueDay then
            Error('Statement Day cannot be the same as Due Day.');
    end;
}
