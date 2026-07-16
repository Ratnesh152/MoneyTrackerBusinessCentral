enum 80112 "MT Loan Payment Method"
{
    Extensible = true;

    value(0; "Bank Transfer") { Caption = 'Bank Transfer'; }
    value(1; UPI) { Caption = 'UPI'; }
    value(2; Cash) { Caption = 'Cash'; }
    value(3; Cheque) { Caption = 'Cheque'; }
    value(4; "Auto Debit") { Caption = 'Auto Debit'; }
    value(5; Card) { Caption = 'Card'; }
    value(6; Other) { Caption = 'Other'; }
}
