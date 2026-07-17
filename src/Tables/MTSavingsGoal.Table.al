namespace MoneyTrackerPro.Foundation;

table 80117 "MT Savings Goal"
{
    Caption = 'MoneyTracker Savings Goal';
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
        field(3; "Goal Name"; Text[100])
        {
            Caption = 'Goal Name';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; "Goal Type"; Enum MTSavingsGoalType)
        {
            Caption = 'Goal Type';
            DataClassification = CustomerContent;
        }
        field(5; "Target Amount"; Decimal)
        {
            Caption = 'Target Amount';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec."Target Amount" <= 0 then
                    Error('Target Amount must be greater than zero.');
                
                if Rec."Opening Saved Amount" > Rec."Target Amount" then
                    Error('Opening Saved Amount cannot exceed Target Amount.');
            end;
        }
        field(6; "Opening Saved Amount"; Decimal)
        {
            Caption = 'Opening Saved Amount';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec."Opening Saved Amount" < 0 then
                    Error('Opening Saved Amount cannot be negative.');
                
                if Rec."Opening Saved Amount" > Rec."Target Amount" then
                    Error('Opening Saved Amount cannot exceed Target Amount.');
            end;
        }
        field(7; "Target Date"; Date)
        {
            Caption = 'Target Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec."Target Date" <> 0D then
                    if Rec."Target Date" < Today then
                        Error('Target Date cannot be in the past.');
            end;
        }
        field(8; "Monthly Contribution"; Decimal)
        {
            Caption = 'Monthly Contribution';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if Rec."Monthly Contribution" < 0 then
                    Error('Monthly Contribution cannot be negative.');
            end;
        }
        field(9; "Auto Contribute"; Boolean)
        {
            Caption = 'Auto Contribute';
            DataClassification = CustomerContent;
            InitValue = false;
        }
        field(10; "Status"; Enum MTSavingsGoalStatus)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            InitValue = Active;
        }
        field(11; "Notes"; Text[250])
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
        if Rec."Goal Name" = '' then
            Error('Goal Name must not be blank.');
        if Rec."Target Amount" <= 0 then
            Error('Target Amount must be greater than zero.');
    end;
}
