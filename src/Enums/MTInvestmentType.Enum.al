enum 80106 MTInvestmentType
{
    Extensible = true;

    value(0; FixedDeposit) { Caption = 'Fixed Deposit'; }
    value(1; RecurringDeposit) { Caption = 'Recurring Deposit'; }
    value(2; SIP) { Caption = 'SIP'; }
    value(3; MutualFund) { Caption = 'Mutual Fund'; }
    value(4; Stock) { Caption = 'Stock'; }
    value(5; Gold) { Caption = 'Gold'; }
    value(6; Crypto) { Caption = 'Crypto'; }
    value(7; Custom) { Caption = 'Custom'; }
}
