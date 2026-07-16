table 80114 "MT Loan Payment"
{
    DataClassification = CustomerContent;
    Caption = 'MT Loan Payment';

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; OwnerEntraObjectId; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Owner Entra Object Id';
        }
        field(3; LoanSystemId; Guid)
        {
            DataClassification = CustomerContent;
            Caption = 'Loan System Id';
        }
        field(4; PaymentDate; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Date';
        }
        field(5; EMINumber; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'EMI Number';
            MinValue = 1;
        }
        field(6; AmountPaid; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount Paid';
            MinValue = 0;
        }
        field(7; PaymentMethod; Enum "MT Loan Payment Method")
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Method';
        }
        field(8; TransactionReference; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Transaction Reference';
        }
        field(9; Notes; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Notes';
        }
        field(10; Status; Enum "MT Loan Payment Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            InitValue = Pending;
        }
    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
        // Duplicate Prevention Rule: One payment per EMI per loan
        key(UniquePayment; LoanSystemId, EMINumber)
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        ValidatePaymentDate();
    end;

    trigger OnModify()
    begin
        if xRec.Status = Status::Paid then begin
            if (Rec.EMINumber <> xRec.EMINumber) then
                Error('You cannot change the EMI Number of a paid record.');
            if (Rec.LoanSystemId <> xRec.LoanSystemId) then
                Error('You cannot change the Loan of a paid record.');
            if (Rec.PaymentDate <> xRec.PaymentDate) then
                Error('You cannot change the Payment Date of a paid record.');
            if (Rec.AmountPaid <> xRec.AmountPaid) then
                Error('You cannot change the Amount Paid of a paid record.');
        end;

        ValidatePaymentDate();
    end;

    local procedure ValidatePaymentDate()
    var
        LoanRec: Record "MT Loan";
    begin
        if LoanRec.GetBySystemId(Rec.LoanSystemId) then begin
            if Rec.PaymentDate < LoanRec.StartDate then
                Error('Payment Date cannot be before the Loan Start Date.');
            
            if Rec.EMINumber > LoanRec.TenureMonths then
                Error('EMI Number cannot be greater than the Loan Tenure.');
        end;
    end;
}
