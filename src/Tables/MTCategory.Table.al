namespace MoneyTrackerPro.Foundation;

table 80105 "MT Category"
{
    Caption = 'MoneyTracker Category';
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
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(5; "Transaction Type"; Enum "MT Category Type")
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;
        }
        field(6; "Is Active"; Boolean)
        {
            Caption = 'Is Active';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(7; "Display Order"; Integer)
        {
            Caption = 'Display Order';
            DataClassification = CustomerContent;
        }
        field(8; "Color Code"; Text[7])
        {
            Caption = 'Color Code';
            DataClassification = CustomerContent;
        }
        field(9; "Icon Name"; Text[50])
        {
            Caption = 'Icon Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(OwnerCode; "Owner Entra Object Id", "Code")
        {
        }
        key(OwnerOrder; "Owner Entra Object Id", "Display Order")
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
        if Rec.Code = '' then
            Error('Code must not be blank.');
        if Rec.Name = '' then
            Error('Name must not be blank.');
    end;
}
