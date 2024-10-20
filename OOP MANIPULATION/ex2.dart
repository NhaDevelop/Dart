enum Status {
  ACTIVE("active"),
  INACTIVE("inactive"),
  CLOSED("closed"),
  SUSPENDED("suspended"),
  PENDING("pending");

  final String label;
  const Status(this.label);

  @override
  String toString() => label;
}

class Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final String description;

  Transaction(this.id, this.amount, this.date, this.description);

  @override
  String toString() => '$id: $amount on ${date.toIso8601String()} ($description)';
}

class BankAccount {
  final String accountNumber, accountType, accountHolder;
  double balance;
  final double interestRate;
  final DateTime createdDate;
  Status status;
  final List<Transaction> transactions;

  BankAccount({
    required this.accountNumber,
    required this.accountType,
    required this.accountHolder,
    required this.balance,
    required this.interestRate,
    required this.createdDate,
    required this.status,
  }) : transactions = [];

  void credit(double amount) {
    if (amount <= 0) throw Exception('Invalid amount');
    balance += amount;
    transactions.add(Transaction('TX${transactions.length + 1}', amount, DateTime.now(), 'Credit'));
  }

  void withdraw(double amount) {
    if (amount <= 0 || amount > balance) throw Exception('Insufficient funds');
    balance -= amount;
    transactions.add(Transaction('TX${transactions.length + 1}', -amount, DateTime.now(), 'Withdrawal'));
  }

  @override
  String toString() => '$accountNumber ($accountHolder) - Balance: $balance';
}

class Bank {
  final String name, address, contactInfo;
  final List<BankAccount> accounts = [];

  Bank(this.name, this.address, this.contactInfo);

  BankAccount createAccount({
    required String accountNumber,
    required String accountType,
    required String accountHolder,
    required double initialBalance,
    required double interestRate,
    required Status status,
  }) {
    if (accounts.any((acc) => acc.accountNumber == accountNumber)) {
      throw Exception('Account already exists');
    }
    var account = BankAccount(
      accountNumber: accountNumber,
      accountType: accountType,
      accountHolder: accountHolder,
      balance: initialBalance,
      interestRate: interestRate,
      createdDate: DateTime.now(),
      status: status,
    );
    accounts.add(account);
    return account;
  }

  void listAccounts() {
    accounts.forEach(print);
  }
}

void main() {
  var bank = Bank('CADT Bank', '123 Bank St', 'info@cadtbank.com');

  try {
    var acc1 = bank.createAccount(
      accountNumber: '001',
      accountType: 'Savings',
      accountHolder: 'Ronan',
      initialBalance: 100,
      interestRate: 0.02,
      status: Status.ACTIVE,
    );

    acc1.credit(100);
    print('Balance: ${acc1.balance}');

    acc1.withdraw(50);
    print('Balance: ${acc1.balance}');

    try {
      acc1.withdraw(75);
    } catch (e) {
      print(e);
    }

    bank.listAccounts();
  } catch (e) {
    print(e);
  }
}
