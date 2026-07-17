namespace MoneyTrackerPro.Foundation;

page 80118 "MT Savings Goals API"
{
    PageType = API;
    APIPublisher = 'alletec';
    APIGroup = 'moneyTracker';
    APIVersion = 'v1.0';
    EntityName = 'savingsGoal';
    EntitySetName = 'savingsGoals';
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTable = "MT Savings Goal";
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
                field(goalName; Rec."Goal Name")
                {
                    ApplicationArea = All;
                }
                field(goalType; Rec."Goal Type")
                {
                    ApplicationArea = All;
                }
                field(targetAmount; Rec."Target Amount")
                {
                    ApplicationArea = All;
                }
                field(openingSavedAmount; Rec."Opening Saved Amount")
                {
                    ApplicationArea = All;
                }
                field(targetDate; Rec."Target Date")
                {
                    ApplicationArea = All;
                }
                field(monthlyContribution; Rec."Monthly Contribution")
                {
                    ApplicationArea = All;
                }
                field(autoContribute; Rec."Auto Contribute")
                {
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(notes; Rec.Notes)
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
