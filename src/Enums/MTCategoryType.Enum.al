namespace MoneyTrackerPro.Foundation;

enum 80100 "MT Category Type"
{
    Extensible = true;

    value(0; Expense)
    {
        Caption = 'Expense';
    }
    value(1; Income)
    {
        Caption = 'Income';
    }
}
