namespace MoneyTrackerPro.Foundation;

table 80106 "MT Budget"
{
    Caption = 'MoneyTracker Budget';
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
        field(3; "Category Id"; Guid)
        {
            Caption = 'Category Id';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = "MT Category".SystemId;
        }
        field(4; "Budget Month"; Integer)
        {
            Caption = 'Budget Month';
            DataClassification = CustomerContent;
            MinValue = 1;
            MaxValue = 12;
        }
        field(5; "Budget Year"; Integer)
        {
            Caption = 'Budget Year';
            DataClassification = CustomerContent;
            MinValue = 2000;
            MaxValue = 2100;
        }
        field(6; "Budget Amount"; Decimal)
        {
            Caption = 'Budget Amount';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(7; "Notes"; Text[2048])
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
        key(UniqueBudget; "Owner Entra Object Id", "Category Id", "Budget Month", "Budget Year")
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        CheckMandatoryFields();
        CheckUniqueness();
    end;

    trigger OnModify()
    begin
        CheckMandatoryFields();
        CheckUniqueness();
    end;

    local procedure CheckMandatoryFields()
    begin
        if IsNullGuid(Rec."Owner Entra Object Id") then
            Error('Owner Entra Object Id must not be empty.');
        if IsNullGuid(Rec."Category Id") then
            Error('Category Id must not be empty.');
        if (Rec."Budget Month" < 1) or (Rec."Budget Month" > 12) then
            Error('Budget Month must be between 1 and 12.');
        if (Rec."Budget Year" < 2000) then
            Error('Budget Year is invalid.');
    end;

    local procedure CheckUniqueness()
    var
        MTBudget: Record "MT Budget";
    begin
        MTBudget.SetRange("Owner Entra Object Id", Rec."Owner Entra Object Id");
        MTBudget.SetRange("Category Id", Rec."Category Id");
        MTBudget.SetRange("Budget Month", Rec."Budget Month");
        MTBudget.SetRange("Budget Year", Rec."Budget Year");
        MTBudget.SetFilter("Entry No.", '<>%1', Rec."Entry No.");
        if not MTBudget.IsEmpty() then
            Error('A budget for this category, month, and year already exists for this user.');
    end;
}
