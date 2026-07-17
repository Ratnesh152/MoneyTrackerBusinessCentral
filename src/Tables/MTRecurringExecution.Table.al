namespace MoneyTrackerPro.Foundation;

table 80116 "MT Recurring Execution"
{
    Caption = 'MoneyTracker Recurring Execution';
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
        field(3; "Recurring Trans. System Id"; Guid)
        {
            Caption = 'Recurring Transaction System Id';
            DataClassification = CustomerContent;
            TableRelation = "MT Recurring Transaction".SystemId;
            NotBlank = true;
        }
        field(4; "Generated Trans. System Id"; Guid)
        {
            Caption = 'Generated Transaction System Id';
            DataClassification = CustomerContent;
            TableRelation = "MT Transaction".SystemId;
        }
        field(5; "Scheduled Date"; Date)
        {
            Caption = 'Scheduled Date';
            DataClassification = CustomerContent;
        }
        field(6; "Generated Date Time"; DateTime)
        {
            Caption = 'Generated Date Time';
            DataClassification = CustomerContent;
        }
        field(7; "Status"; Enum "MT Recurring Execution Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(8; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(OwnerRecurringId; "Owner Entra Object Id", "Recurring Trans. System Id")
        {
        }
    }

    trigger OnInsert()
    begin
        if IsNullGuid(Rec."Owner Entra Object Id") then
            Error('Owner Entra Object Id must not be empty.');
        if IsNullGuid(Rec."Recurring Trans. System Id") then
            Error('Recurring Transaction System Id must not be empty.');
        if Rec."Scheduled Date" = 0D then
            Error('Scheduled Date must not be empty.');
    end;
}
