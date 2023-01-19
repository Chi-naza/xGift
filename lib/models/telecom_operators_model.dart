class TeleComOperatorsModel {
	int id;
	int operatorId;
	String name;
	bool bundle;
	bool data;
	bool pin;
	bool supportsLocalAmounts;
	bool supportsGeographicalRechargePlans;
	String? denominationType;
	String? senderCurrencyCode;
	String? senderCurrencySymbol;
	String? destinationCurrencyCode;
	String? destinationCurrencySymbol;
	dynamic commission;
	dynamic internationalDiscount;
	dynamic localDiscount;
	dynamic mostPopularAmount;
	dynamic mostPopularLocalAmount;
	dynamic minAmount;
	dynamic maxAmount;
	dynamic localMinAmount;
	dynamic localMaxAmount;
	Country country;
	Fx? fx;
	List<String> logoUrls;
	List? fixedAmounts;
	Map? fixedAmountsDescriptions;
	List localFixedAmounts;
	Map? localFixedAmountsDescriptions;
	List suggestedAmounts;
	Map? suggestedAmountsMap;
	List geographicalRechargePlans;
	List promotions;
	String status;





	TeleComOperatorsModel({
    required this.id, 
    required this.operatorId, 
    required this.name, 
    required this.bundle, 
    required this.data, 
    required this.pin, 
    required this.supportsLocalAmounts, 
    required this.supportsGeographicalRechargePlans, 
    required this.denominationType, 
    required this.senderCurrencyCode, 
    required this.senderCurrencySymbol, 
    required this.destinationCurrencyCode, 
    required this.destinationCurrencySymbol, 
    required this.commission, 
    required this.internationalDiscount, 
    required this.localDiscount, 
    required this.mostPopularAmount, 
    this.mostPopularLocalAmount, 
    required this.minAmount, 
    required this.maxAmount, 
    required this.localMinAmount, 
    required this.localMaxAmount, 
    required this.country, 
    this.fx, 
    required this.logoUrls, 
    this.fixedAmounts, 
    this.fixedAmountsDescriptions, 
    required this.localFixedAmounts, 
    this.localFixedAmountsDescriptions, 
    required this.suggestedAmounts, 
    this.suggestedAmountsMap, 
    required this.geographicalRechargePlans, 
    required this.promotions, 
    required this.status
  });




	TeleComOperatorsModel.fromJson(Map<String, dynamic> json) :
		id = json['id'],
		operatorId = json['operatorId'],
		name = json['name'],
		bundle = json['bundle'],
		data = json['data'],
		pin = json['pin'],
		supportsLocalAmounts = json['supportsLocalAmounts'],
		supportsGeographicalRechargePlans = json['supportsGeographicalRechargePlans'],
		denominationType = json['denominationType'],
		senderCurrencyCode = json['senderCurrencyCode'],
		senderCurrencySymbol = json['senderCurrencySymbol'],
		destinationCurrencyCode = json['destinationCurrencyCode'],
		destinationCurrencySymbol = json['destinationCurrencySymbol'],
		commission = json['commission'],
		internationalDiscount = json['internationalDiscount'],
		localDiscount = json['localDiscount'],
		mostPopularAmount = json['mostPopularAmount'],
		mostPopularLocalAmount = json['mostPopularLocalAmount'],
		minAmount = json['minAmount'],
		maxAmount = json['maxAmount'],
		localMinAmount = json['localMinAmount'],
		localMaxAmount = json['localMaxAmount'],
		country = Country.fromJson(json['country']),
		fx = json['fx'] != null ? Fx.fromJson(json['fx']) : null,
		logoUrls = json['logoUrls'].cast<String>(),
		fixedAmounts = json['fixedAmounts'],
		fixedAmountsDescriptions = json['fixedAmountsDescriptions'] != null ? json['fixedAmountsDescriptions'] : null,
		localFixedAmounts = json['localFixedAmounts'],		
		localFixedAmountsDescriptions = json['localFixedAmountsDescriptions'] != null ? json['localFixedAmountsDescriptions'] : null,
		suggestedAmounts = json['suggestedAmounts'],
		suggestedAmountsMap = json['suggestedAmountsMap'] != null ? json['suggestedAmountsMap'] : null,
		geographicalRechargePlans = json['geographicalRechargePlans'],
		promotions = json['promotions'],
		status = json['status'];
	





	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();

		data['id'] = this.id;
		data['operatorId'] = this.operatorId;
		data['name'] = this.name;
		data['bundle'] = this.bundle;
		data['data'] = this.data;
		data['pin'] = this.pin;
		data['supportsLocalAmounts'] = this.supportsLocalAmounts;
		data['supportsGeographicalRechargePlans'] = this.supportsGeographicalRechargePlans;
		data['denominationType'] = this.denominationType;
		data['senderCurrencyCode'] = this.senderCurrencyCode;
		data['senderCurrencySymbol'] = this.senderCurrencySymbol;
		data['destinationCurrencyCode'] = this.destinationCurrencyCode;
		data['destinationCurrencySymbol'] = this.destinationCurrencySymbol;
		data['commission'] = this.commission;
		data['internationalDiscount'] = this.internationalDiscount;
		data['localDiscount'] = this.localDiscount;
		data['mostPopularAmount'] = this.mostPopularAmount;
		data['mostPopularLocalAmount'] = this.mostPopularLocalAmount;
		data['minAmount'] = this.minAmount;
		data['maxAmount'] = this.maxAmount;
		data['localMinAmount'] = this.localMinAmount;
		data['localMaxAmount'] = this.localMaxAmount;
    data['country'] = this.country;
    data['fx'] = this.fx;
    data['fixedAmounts'] = this.fixedAmounts;
    data['fixedAmountsDescriptions'] = this.fixedAmountsDescriptions;
    data['localFixedAmounts'] = this.localFixedAmounts;
    data['localFixedAmountsDescriptions'] = this.localFixedAmountsDescriptions;
    data['suggestedAmounts'] = this.suggestedAmounts;
    data['suggestedAmountsMap'] = this.suggestedAmountsMap;
    data['geographicalRechargePlans'] = this.geographicalRechargePlans;
    data['promotions'] = this.promotions;
		data['status'] = this.status;

		return data;
	}



}






class Country {
	String isoName;
	String name;

	Country({required this.isoName, required this.name});

	Country.fromJson(Map<String, dynamic> json):
		isoName = json['isoName'],
		name = json['name'];
	

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isoName'] = this.isoName;
		data['name'] = this.name;
		return data;
	}
}








class Fx {
	dynamic rate;
	String currencyCode;

	Fx({ required this.rate, required this.currencyCode});

	Fx.fromJson(Map<String, dynamic> json) :
		rate = json['rate'],
		currencyCode = json['currencyCode'];
	

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rate'] = this.rate;
		data['currencyCode'] = this.currencyCode;
		return data;
	}
  
}







// class FixedAmountsDescriptions {


// 	FixedAmountsDescriptions({});

// 	FixedAmountsDescriptions.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }









