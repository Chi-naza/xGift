class CompanyReloadlyBalanceModel {
  double balance;
  String currencyCode;
  String currencyName;
  String updatedAt;


  CompanyReloadlyBalanceModel({required this.balance, required this.currencyCode, required this.currencyName, required this.updatedAt});


  CompanyReloadlyBalanceModel.fromJson(Map<String, dynamic> json):
    balance = json['balance'],
    currencyCode = json['currencyCode'],
    currencyName = json['currencyName'],
    updatedAt = json['updatedAt'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['currencyCode'] = this.currencyCode;
    data['currencyName'] = this.currencyName;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
  
}