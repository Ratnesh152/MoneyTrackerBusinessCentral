enum 80113 "MT Loan Payment Status"
{
    Extensible = true;

    value(0; Pending) { Caption = 'Pending'; }
    value(1; Paid) { Caption = 'Paid'; }
    value(2; "Partially Paid") { Caption = 'Partially Paid'; }
    value(3; Skipped) { Caption = 'Skipped'; }
    value(4; Cancelled) { Caption = 'Cancelled'; }
}
