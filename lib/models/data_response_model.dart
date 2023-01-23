
class DataResponseModel {
  
  String phoneNumber;
  String provider;
  String status;
  String transactionId;
  String value;


  DataResponseModel({
    required this.phoneNumber,
    required this.provider,
    required this.status,
    required this.transactionId,
    required this.value
    });



  DataResponseModel.fromJson(Map<String, dynamic> json) :
    phoneNumber = json['phoneNumber'],
    provider = json['provider'],
    status = json['status'],
    transactionId = json['transactionId'],
    value = json['value'];
  



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['provider'] = this.provider;
    data['status'] = this.status;
    data['transactionId'] = this.transactionId;
    data['value'] = this.value;
    return data;
  }

}
