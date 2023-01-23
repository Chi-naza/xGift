class UserCountryDetailModel {
  String isoName;
  String name;
  String continent;
  String currencyCode;
  String currencyName;
  String currencySymbol;
  String flag;
  List<String> callingCodes;

  UserCountryDetailModel({
    required this.isoName,
    required this.name,
    required this.continent,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    required this.flag,
    required this.callingCodes
  });

  UserCountryDetailModel.fromJson(Map<String, dynamic> json):
    isoName = json['isoName'],
    name = json['name'],
    continent = json['continent'],
    currencyCode = json['currencyCode'],
    currencyName = json['currencyName'],
    currencySymbol = json['currencySymbol'],
    flag = json['flag'],
    callingCodes = json['callingCodes'].cast<String>();
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isoName'] = this.isoName;
    data['name'] = this.name;
    data['continent'] = this.continent;
    data['currencyCode'] = this.currencyCode;
    data['currencyName'] = this.currencyName;
    data['currencySymbol'] = this.currencySymbol;
    data['flag'] = this.flag;
    data['callingCodes'] = this.callingCodes;
    return data;
  }


  
}
