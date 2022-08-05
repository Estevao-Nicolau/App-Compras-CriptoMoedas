class CardModel {
  late final int balance;
  late final String name;
  late final String validDate;
  late final String accountNumber;

  CardModel(this.accountNumber, this.name, this.validDate,
      this.balance);
}