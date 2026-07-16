namespace MoneyTrackerPro.Foundation;

page 80101 "MT Transaction List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MT Transaction";
    Caption = 'MT Transactions';

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
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                }
                field("Subcategory Code"; Rec."Subcategory Code")
                {
                    ApplicationArea = All;
                }
                field("Account Code"; Rec."Account Code")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Reference"; Rec."Reference")
                {
                    ApplicationArea = All;
                }
                field("Notes"; Rec."Notes")
                {
                    ApplicationArea = All;
                }
                field("Tags"; Rec."Tags")
                {
                    ApplicationArea = All;
                }
                // field("Category Id"; Rec."Category Id")
                // {
                //     ApplicationArea = All;
                // }
                // field("Account Id"; Rec."Account Id")
                // {
                //     ApplicationArea = All;
                // }
            }
        }
    }
}
