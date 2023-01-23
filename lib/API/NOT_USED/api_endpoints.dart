class APIendPoints {

  // base url
  static const String BASE_URL = "https://topups.reloadly.com";
  static const String BASE_URL_SANDBOX = "https://topups-sandbox.reloadly.com";


  // get access token
  static const String getAccessTokenAPI = "https://auth.reloadly.com/oauth/token";



  // getCompanyBalance
  static const String getCompanyBalanceAPI = "$BASE_URL_SANDBOX/accounts/balance/";



  // getDetailsofACountryAPI: a getter method that returns the API to get a specific country's detail
  static String getDetailsofACountryAPI(String countryCode) {
    String url = "$BASE_URL_SANDBOX/countries/$countryCode";
    return url;
  }



  // Auto-detect the operator of a phone number by passing the country and ISOcode
  static String deciferAMobileNumberAPI(String phoneNumber, String ISOcode) {
    String url = "$BASE_URL_SANDBOX/operators/auto-detect/phone/$phoneNumber/countries/$ISOcode";
    return url;
  }




  // fetchAvailableOperatorsAPI: to fetch all telecom operators of a country by passing the ISO of the country
  static String fetchAvailableOperatorsAPI(String ISOcode) {
    String url = "$BASE_URL_SANDBOX/operators/countries/$ISOcode";
    return url;
  }




  // The main API to make both an Airtime and Mobile Data TopUp
  static const String makeATopUpAPI = "$BASE_URL_SANDBOX/topups/";



  // A function which returns a Header (one with the bearer token)
  static Map<String, String> headerWithToken(String token){

    Map<String, String> headers = {
      "Accept": "application/com.reloadly.topups-v1+json",
      "Authorization": "Bearer $token"
    };

    return headers;
  }


  // A static function which returns a payload for TOP-UP POST request
  static Map payloadForTopUp({
    required String operatorID, 
    required String amount, 
    required String recipientEmail, 
    required String recipientPhoneNumber,
    required String recipientCountryCode,
    required String senderCountryCode,
    required String senderPhoneNumber,
  }){
    var payload = {
      "operatorId": operatorID,
      "amount": amount,
      "useLocalAmount": true,
      "customIdentifier": "",
      "recipientEmail": "",
      "recipientPhone": {
        "countryCode": recipientCountryCode,
        "number": recipientPhoneNumber , // eg "447951731337"
      },
      "senderPhone": {
        "countryCode": senderCountryCode,
        "number": senderPhoneNumber
      }
    };

    return payload;
  }




}