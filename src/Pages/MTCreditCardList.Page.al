page 80109 "MT Credit Card List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MT Credit Card";
    Caption = 'MT Credit Cards';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("EntryNo"; Rec."EntryNo")
                {
                    ApplicationArea = All;
                }
                field("OwnerEntraObjectId"; Rec."OwnerEntraObjectId")
                {
                    ApplicationArea = All;
                }
                field("CardName"; Rec."CardName")
                {
                    ApplicationArea = All;
                }
                field("IssuingBank"; Rec."IssuingBank")
                {
                    ApplicationArea = All;
                }
                field("CardNetwork"; Rec."CardNetwork")
                {
                    ApplicationArea = All;
                }
                field("Last4Digits"; Rec."Last4Digits")
                {
                    ApplicationArea = All;
                }
                field("CreditLimit"; Rec."CreditLimit")
                {
                    ApplicationArea = All;
                }
                field("CurrencyCode"; Rec."CurrencyCode")
                {
                    ApplicationArea = All;
                }
                field("StatementDay"; Rec."StatementDay")
                {
                    ApplicationArea = All;
                }
                field("DueDay"; Rec."DueDay")
                {
                    ApplicationArea = All;
                }
                field("InterestRate"; Rec."InterestRate")
                {
                    ApplicationArea = All;
                }
                field("AnnualFee"; Rec."AnnualFee")
                {
                    ApplicationArea = All;
                }
                field("SupportsEMI"; Rec."SupportsEMI")
                {
                    ApplicationArea = All;
                }
                field("IsActive"; Rec."IsActive")
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
