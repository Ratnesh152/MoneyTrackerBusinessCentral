namespace MoneyTrackerPro.Foundation;

table 80102 "MT Transaction"
{
    Caption = 'MoneyTracker Transaction';
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
        field(3; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = CustomerContent;
        }
        field(4; "Transaction Type"; Enum "MT Transaction Type")
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(5; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(6; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(7; "Subcategory Code"; Code[20])
        {
            Caption = 'Subcategory Code';
            DataClassification = CustomerContent;
        }
        field(8; "Account Code"; Code[20])
        {
            Caption = 'Account Code';
            DataClassification = CustomerContent;
            NotBlank = true;
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
        field(10; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
        }
        field(11; "Payment Method Code"; Code[20])
        {
            Caption = 'Payment Method Code';
            DataClassification = CustomerContent;
        }
        field(12; "Reference"; Text[100])
        {
            Caption = 'Reference';
            DataClassification = CustomerContent;
        }
        field(13; "Notes"; Text[2048])
        {
            Caption = 'Notes';
            DataClassification = CustomerContent;
        }
        field(14; "Tags"; Text[250])
        {
            Caption = 'Tags';
            DataClassification = CustomerContent;
        }
        field(15; "Category Id"; Guid)
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
        field(16; "Account Id"; Guid)
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
                    Rec."Account Code" := MTAccount.Name; // Account Code holds the Name/Code for readability
                end else
                    Rec."Account Code" := '';
            end;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(OwnerDate; "Owner Entra Object Id", "Transaction Date")
        {
        }
        key(OwnerType; "Owner Entra Object Id", "Transaction Type")
        {
        }
        key(OwnerAccountCategoryType; "Owner Entra Object Id", "Account Id", "Category Id", "Transaction Type")
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
        if Rec."Transaction Date" = 0D then
            Error('Transaction Date must not be empty.');
        if Rec.Description = '' then
            Error('Description must not be blank.');
        if IsNullGuid(Rec."Account Id") then
            Error('Account Id must not be empty.');
        if Rec."Account Code" = '' then
            Error('Account Code must not be blank.');
        if IsNullGuid(Rec."Category Id") then
            Error('Category Id must not be empty.');
        if Rec."Category Code" = '' then
            Error('Category Code must not be blank.');
        if Rec.Amount <= 0 then
            Error('Amount must be greater than zero.');
    end;
}
