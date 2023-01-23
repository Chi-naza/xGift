
class TopUpResponseModel {

  int transactionId;
  String status;
  String operatorTransactionId;
  String customIdentifier;
  int recipientPhone;
  String? recipientEmail;
  int senderPhone;
  String countryCode;
  int operatorId;
  String operatorName;
  double discount;
  String discountCurrencyCode;
  double requestedAmount;
  String requestedAmountCurrencyCode;
  double deliveredAmount;
  String deliveredAmountCurrencyCode;
  String transactionDate;
  PinDetail? pinDetail;
  BalanceInfo? balanceInfo;


  TopUpResponseModel({
    required this.transactionId,
    required this.status,
    required this.operatorTransactionId,
    required this.customIdentifier,
    required this.recipientPhone,
    this.recipientEmail,
    required this.senderPhone,
    required this.countryCode,
    required this.operatorId,
    required this.operatorName,
    required this.discount,
    required this.discountCurrencyCode,
    required this.requestedAmount,
    required this.requestedAmountCurrencyCode,
    required this.deliveredAmount,
    required this.deliveredAmountCurrencyCode,
    required this.transactionDate,
    this.pinDetail,
    this.balanceInfo
  });



  TopUpResponseModel.fromJson(Map<String, dynamic> json):
    transactionId = json['transactionId'],
    status = json['status'],
    operatorTransactionId = json['operatorTransactionId'],
    customIdentifier = json['customIdentifier'],
    recipientPhone = json['recipientPhone'],
    recipientEmail = json['recipientEmail'],
    senderPhone = json['senderPhone'],
    countryCode = json['countryCode'],
    operatorId = json['operatorId'],
    operatorName = json['operatorName'],
    discount = json['discount'],
    discountCurrencyCode = json['discountCurrencyCode'],
    requestedAmount = json['requestedAmount'],
    requestedAmountCurrencyCode = json['requestedAmountCurrencyCode'],
    deliveredAmount = json['deliveredAmount'],
    deliveredAmountCurrencyCode = json['deliveredAmountCurrencyCode'],
    transactionDate = json['transactionDate'],
    pinDetail = json['pinDetail'] == null? null : PinDetail.fromJson(json['pinDetail']),  
    balanceInfo = json['balanceInfo'] == null? null : BalanceInfo.fromJson(json['balanceInfo']);
  




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['transactionId'] = this.transactionId;
    data['status'] = this.status;
    data['operatorTransactionId'] = this.operatorTransactionId;
    data['customIdentifier'] = this.customIdentifier;
    data['recipientPhone'] = this.recipientPhone;
    data['recipientEmail'] = this.recipientEmail;
    data['senderPhone'] = this.senderPhone;
    data['countryCode'] = this.countryCode;
    data['operatorId'] = this.operatorId;
    data['operatorName'] = this.operatorName;
    data['discount'] = this.discount;
    data['discountCurrencyCode'] = this.discountCurrencyCode;
    data['requestedAmount'] = this.requestedAmount;
    data['requestedAmountCurrencyCode'] = this.requestedAmountCurrencyCode;
    data['deliveredAmount'] = this.deliveredAmount;
    data['deliveredAmountCurrencyCode'] = this.deliveredAmountCurrencyCode;
    data['transactionDate'] = this.transactionDate;
    data['pinDetail'] = this.pinDetail;
    data['balanceInfo'] = this.balanceInfo;
    
    return data;
  }
}




class PinDetail {
  int serial;
  String info1;
  String info2;
  String info3;
  dynamic value;
  int code;
  String ivr;
  String validity;


  PinDetail({
    required this.serial,
    required this.info1,
    required this.info2,
    required this.info3,
    required this.value,
    required this.code,
    required this.ivr,
    required this.validity
  });


  PinDetail.fromJson(Map<String, dynamic> json):
    serial = json['serial'],
    info1 = json['info1'],
    info2 = json['info2'],
    info3 = json['info3'],
    value = json['value'],
    code = json['code'],
    ivr = json['ivr'],
    validity = json['validity'];
  



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serial'] = this.serial;
    data['info1'] = this.info1;
    data['info2'] = this.info2;
    data['info3'] = this.info3;
    data['value'] = this.value;
    data['code'] = this.code;
    data['ivr'] = this.ivr;
    data['validity'] = this.validity;
    return data;
  }



}




class BalanceInfo {

  double oldBalance;
  double newBalance;
  String currencyCode;
  String currencyName;
  String updatedAt;

  BalanceInfo({
    required this.oldBalance,
    required this.newBalance,
    required this.currencyCode,
    required this.currencyName,
    required this.updatedAt
    });

  BalanceInfo.fromJson(Map<String, dynamic> json):
    oldBalance = json['oldBalance'],
    newBalance = json['newBalance'],
    currencyCode = json['currencyCode'],
    currencyName = json['currencyName'],
    updatedAt = json['updatedAt'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oldBalance'] = this.oldBalance;
    data['newBalance'] = this.newBalance;
    data['currencyCode'] = this.currencyCode;
    data['currencyName'] = this.currencyName;
    data['updatedAt'] = this.updatedAt;
    return data;
  }




}
