class HistoryModel {
  final String monthName;
  final double transactionLength;

  HistoryModel({required this.monthName, required this.transactionLength});
}

final List<HistoryModel> myTransactionHistory = [
  HistoryModel(monthName: "Jul", transactionLength: 100),
  HistoryModel(monthName: "Aug", transactionLength: 130),
  HistoryModel(monthName: "Sep", transactionLength: 70),
  HistoryModel(monthName: "Oct", transactionLength: 50),
  HistoryModel(monthName: "Nov", transactionLength: 40),
  HistoryModel(monthName: "Dec", transactionLength: 60),
  HistoryModel(monthName: "Jan", transactionLength: 80),
  HistoryModel(monthName: "Feb", transactionLength: 50),
  HistoryModel(monthName: "Mar", transactionLength: 110),
  HistoryModel(monthName: "April", transactionLength: 150),
];
