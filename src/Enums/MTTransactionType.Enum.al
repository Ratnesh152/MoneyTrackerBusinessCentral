namespace MoneyTrackerPro.Foundation;

enum 80101 "MT Transaction Type"
{
    Extensible = false;

    value(0; Income)
    {
        Caption = 'Income';
    }
    value(1; Expense)
    {
        Caption = 'Expense';
    }
}
