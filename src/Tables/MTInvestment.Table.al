namespace MoneyTrackerPro.Foundation;

table 80118 "MT Investment"
{
    Caption = 'MoneyTracker Investment';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Owner Entra Object Id"; Guid)
        {
            Caption = 'Owner Entra Object Id';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
        }
        field(3; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Type"; Enum MTInvestmentType)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(5; "Invested Amount"; Decimal)
        {
            Caption = 'Invested Amount';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec."Invested Amount" < 0 then
                    Error('Invested Amount cannot be negative.');
            end;
        }
        field(6; "Current Value"; Decimal)
        {
            Caption = 'Current Value';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec."Current Value" < 0 then
                    Error('Current Value cannot be negative.');
            end;
        }
        field(7; "Status"; Enum MTInvestmentStatus)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            InitValue = Active;
        }
        field(8; "Notes"; Text[2048])
        {
            Caption = 'Notes';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Owner; "Owner Entra Object Id")
        {
        }
    }

    trigger OnInsert()
    begin
        CheckMandatoryFields();
    end;

    trigger OnModify()
    begin
        CheckMandatoryFields();
    end;

    local procedure CheckMandatoryFields()
    begin
        if IsNullGuid(Rec."Owner Entra Object Id") then
            Error('Owner Entra Object Id must not be empty.');
        if Rec.Name = '' then
            Error('Name must not be blank.');
    end;
}
