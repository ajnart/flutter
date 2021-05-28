class Transaction {
  final int id;
  final String title;
  final double ammount;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.ammount,
      required this.date});
}
