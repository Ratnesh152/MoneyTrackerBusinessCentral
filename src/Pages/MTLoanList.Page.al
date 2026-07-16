page 80114 "MT Loan List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MT Loan";
    Caption = 'MT Loans';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("EntryNo"; Rec."EntryNo")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number.';
                }
                field("OwnerEntraObjectId"; Rec."OwnerEntraObjectId")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the owner.';
                }
                field("LoanName"; Rec."LoanName")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan name.';
                }
                field("LenderName"; Rec."LenderName")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the lender name.';
                }
                field("LoanType"; Rec."LoanType")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan type.';
                }
                field("PrincipalAmount"; Rec."PrincipalAmount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the principal amount.';
                }
                field("InterestRate"; Rec."InterestRate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the interest rate.';
                }
                field("TenureMonths"; Rec."TenureMonths")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the tenure in months.';
                }
                field("EMIAmount"; Rec."EMIAmount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the EMI amount.';
                }
                field("StartDate"; Rec."StartDate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the start date.';
                }
                field("LoanAccountNumber"; Rec."LoanAccountNumber")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan account number.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status.';
                }
            }
        }
    }
}
