namespace MoneyTrackerPro.Foundation;

table 80115 "MT Recurring Transaction"
{
    Caption = 'MoneyTracker Recurring Transaction';
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
        field(4; "Transaction Type"; Enum "MT Transaction Type")
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(5; "Account Id"; Guid)
        {
            Caption = 'Account Id';
            DataClassification = CustomerContent;
            TableRelation = "MT Account".SystemId;

            trigger OnValidate()
            var
                MTAccount: Record "MT Account";
            begin
                if not IsNullGuid(Rec."Account Id") then begin
                    if not MTAccount.GetBySystemId(Rec."Account Id") then
                        Error('The specified Account does not exist.');
                    if MTAccount."Owner Entra Object Id" <> Rec."Owner Entra Object Id" then
                        Error('The Account belongs to a different owner.');
                    Rec."Account Code" := MTAccount.Name;
                end else
                    Rec."Account Code" := '';
            end;
        }
        field(6; "Account Code"; Code[20])
        {
            Caption = 'Account Code';
            DataClassification = CustomerContent;
        }
        field(7; "Category Id"; Guid)
        {
            Caption = 'Category Id';
            DataClassification = CustomerContent;
            TableRelation = "MT Category".SystemId;

            trigger OnValidate()
            var
                MTCategory: Record "MT Category";
            begin
                if not IsNullGuid(Rec."Category Id") then begin
                    if not MTCategory.GetBySystemId(Rec."Category Id") then
                        Error('The specified Category does not exist.');
                    if MTCategory."Owner Entra Object Id" <> Rec."Owner Entra Object Id" then
                        Error('The Category belongs to a different owner.');
                    Rec."Category Code" := MTCategory.Code;
                end else
                    Rec."Category Code" := '';
            end;
        }
        field(8; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = CustomerContent;
        }
        field(9; "Amount"; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec.Amount <= 0 then
                    Error('Amount must be greater than zero.');
            end;
        }
        field(10; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(11; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."End Date" <> 0D) and (Rec."End Date" < Rec."Start Date") then
                    Error('End Date must be greater than or equal to Start Date.');
            end;
        }
        field(12; "Frequency"; Enum "MT Recurring Frequency")
        {
            Caption = 'Frequency';
            DataClassification = CustomerContent;
        }
        field(13; "Interval"; Integer)
        {
            Caption = 'Interval';
            DataClassification = CustomerContent;
            MinValue = 1;
            InitValue = 1;

            trigger OnValidate()
            begin
                if Rec.Interval < 1 then
                    Error('Interval must be at least 1.');
            end;
        }
        field(14; "Next Run Date"; Date)
        {
            Caption = 'Next Run Date';
            DataClassification = CustomerContent;
        }
        field(15; "Auto Generate"; Boolean)
        {
            Caption = 'Auto Generate';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(16; "Active"; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(17; "Notes"; Text[2048])
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
        key(OwnerNextRunDate; "Owner Entra Object Id", "Next Run Date")
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
        if IsNullGuid(Rec."Account Id") then
            Error('Account Id must not be empty.');
        if IsNullGuid(Rec."Category Id") then
            Error('Category Id must not be empty.');
        if Rec.Amount <= 0 then
            Error('Amount must be greater than zero.');
        if Rec."Start Date" = 0D then
            Error('Start Date must not be empty.');
        if Rec.Interval < 1 then
            Error('Interval must be at least 1.');
    end;
}
