class AirtimeResponseModel {

  String errorMessage;
  int numSent;
  String totalAmount;
  String totalDiscount;
  List<AirtimeResponses> responses;

  AirtimeResponseModel({
      required this.errorMessage,
      required this.numSent,
      required this.totalAmount,
      required this.totalDiscount,
      required this.responses
    });

  AirtimeResponseModel.fromJson(Map<String, dynamic> json) :
    errorMessage = json['errorMessage'],
    numSent = json['numSent'],
    totalAmount = json['totalAmount'],
    totalDiscount = json['totalDiscount'],
    responses = (json['responses'] as List).map((data) => AirtimeResponses.fromJson(data)).toList();
   

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMessage'] = this.errorMessage;
    data['numSent'] = this.numSent;
    data['totalAmount'] = this.totalAmount;
    data['totalDiscount'] = this.totalDiscount;
    data['responses'] = this.responses;
    return data;
  }
}






class AirtimeResponses {
  String phoneNumber;
  String errorMessage;
  String amount;
  String status;
  String requestId;
  String discount;


  AirtimeResponses({
    required this.phoneNumber,
    required this.errorMessage,
    required this.amount,
    required this.status,
    required this.requestId,
    required this.discount
    });



  AirtimeResponses.fromJson(Map<String, dynamic> json) :
    phoneNumber = json['phoneNumber'],
    errorMessage = json['errorMessage'],
    amount = json['amount'],
    status = json['status'],
    requestId = json['requestId'],
    discount = json['discount'];
  



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['errorMessage'] = this.errorMessage;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['requestId'] = this.requestId;
    data['discount'] = this.discount;
    return data;
  }


  
}
