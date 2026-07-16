namespace MoneyTrackerPro.Foundation;

page 80103 "MT Budget List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MT Budget";
    Caption = 'MT Budgets';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Owner Entra Object Id"; Rec."Owner Entra Object Id")
                {
                    ApplicationArea = All;
                }
                field("Category Id"; Rec."Category Id")
                {
                    ApplicationArea = All;
                }
                field("Budget Month"; Rec."Budget Month")
                {
                    ApplicationArea = All;
                }
                field("Budget Year"; Rec."Budget Year")
                {
                    ApplicationArea = All;
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = All;
                }
                field("Notes"; Rec."Notes")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
