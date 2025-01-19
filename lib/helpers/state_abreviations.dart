class StateAbreviations {
  static List<Map<String, String>> stateAbreviations = [
    // Load US State Names.
    {"state": "Alabama", "abreviation": "AL"},
    {"state": "Alaska", "abreviation": "AK"},
    {"state": "Arizona", "abreviation": "AZ"},
    {"state": "Arkansas", "abreviation": "AR"},
    {"state": "California", "abreviation": "CA"},
    {"state": "Colorado", "abreviation": "CO"},
    {"state": "Connecticut", "abreviation": "CT"},
    {"state": "Delaware", "abreviation": "DE"},
    {"state": "District Of Columbia", "abreviation": "DC"},
    {"state": "Florida", "abreviation": "FL"},
    {"state": "Georgia", "abreviation": "GA"},
    {"state": "Hawaii", "abreviation": "HI"},
    {"state": "Idaho", "abreviation": "ID"},
    {"state": "Illinois", "abreviation": "IL"},
    {"state": "Indiana", "abreviation": "IN"},
    {"state": "Iowa", "abreviation": "IA"},
    {"state": "Kansas", "abreviation": "KS"},
    {"state": "Kentucky", "abreviation": "KY"},
    {"state": "Louisiana", "abreviation": "LA"},
    {"state": "Maine", "abreviation": "ME"},
    {"state": "Maryland", "abreviation": "MD"},
    {"state": "Massachusetts", "abreviation": "MA"},
    {"state": "Michigan", "abreviation": "MI"},
    {"state": "Minnesota", "abreviation": "MN"},
    {"state": "Mississippi", "abreviation": "MS"},
    {"state": "Missouri", "abreviation": "MO"},
    {"state": "Montana", "abreviation": "MT"},
    {"state": "Nebraska", "abreviation": "NE"},
    {"state": "Nevada", "abreviation": "NV"},
    {"state": "New Hampshire", "abreviation": "NH"},
    {"state": "New Jersey", "abreviation": "NJ"},
    {"state": "New Mexico", "abreviation": "NM"},
    {"state": "New York", "abreviation": "NY"},
    {"state": "North Carolina", "abreviation": "NC"},
    {"state": "North Dakota", "abreviation": "ND"},
    {"state": "Ohio", "abreviation": "OH"},
    {"state": "Oklahoma", "abreviation": "OK"},
    {"state": "Oregon", "abreviation": "OR"},
    {"state": "Pennsylvania", "abreviation": "PA"},
    {"state": "Rhode Island", "abreviation": "RI"},
    {"state": "South Carolina", "abreviation": "SC"},
    {"state": "South Dakota", "abreviation": "SD"},
    {"state": "Tennessee", "abreviation": "TN"},
    {"state": "Texas", "abreviation": "TX"},
    {"state": "Utah", "abreviation": "UT"},
    {"state": "Vermont", "abreviation": "VT"},
    {"state": "Virginia", "abreviation": "VA"},
    {"state": "Washington", "abreviation": "WA"},
    {"state": "West Virginia", "abreviation": "WV"},
    {"state": "Wisconsin", "abreviation": "WI"},
    {"state": "Wyoming", "abreviation": "WY"},
    {"state": "Guam", "abreviation": "GU"},
    {"state": "Puerto Rico", "abreviation": "PR"},
    {"state": "Virgin Islands", "abreviation": "VI"},
    {"state": "Armed Forces (AE)", "abreviation": "AE"},
    {"state": "Armed Forces Americas", "abreviation": "AA"},
    {"state": "Armed Forces Pacific", "abreviation": "AP"},

    // Load Canada State Names.
    {"state": "Alberta", "abreviation": "AB"},
    {"state": "British Columbia", "abreviation": "BC"},
    {"state": "Manitoba", "abreviation": "MB"},
    {"state": "New Brunswick", "abreviation": "NB"},
    {"state": "Newfoundland and Labrador", "abreviation": "NF"},
    {"state": "Northwest Territories", "abreviation": "NT"},
    {"state": "Nova Scotia", "abreviation": "NS"},
    {"state": "Nunavut", "abreviation": "NU"},
    {"state": "Ontario", "abreviation": "ON"},
    {"state": "Prince Edward Island", "abreviation": "PE"},
    {"state": "Quebec", "abreviation": "QC"},
    {"state": "Saskatchewan", "abreviation": "SK"},
    {"state": "Yukon Territory", "abreviation": "YT"},

    // Load México State Names.
    {"state": "Aguascalientes", "abreviation": "AGU"},
    {"state": "Baja California", "abreviation": "BCN"},
    {"state": "Baja California Sur", "abreviation": "BCS"},
    {"state": "Campeche", "abreviation": "CAM"},
    {"state": "Chiapas", "abreviation": "CHP"},
    {"state": "Chihuahua", "abreviation": "CHH"},
    {"state": "Coahuila", "abreviation": "COA"},
    {"state": "Colima", "abreviation": "COL"},
    {"state": "Distrito Federal", "abreviation": "DIF"},
    {"state": "Durango", "abreviation": "DUR"},
    {"state": "Guanajuato", "abreviation": "GUA"},
    {"state": "Guerrero", "abreviation": "GRO"},
    {"state": "Hidalgo", "abreviation": "HID"},
    {"state": "Jalisco", "abreviation": "JAL"},
    {"state": "México", "abreviation": "MEX"},
    {"state": "Michoacán", "abreviation": "MIC"},
    {"state": "Morelos", "abreviation": "MOR"},
    {"state": "Nayarit", "abreviation": "NAY"},
    {"state": "Nuevo León", "abreviation": "NLE"},
    {"state": "Oaxaca", "abreviation": "OAX"},
    {"state": "Puebla", "abreviation": "PUE"},
    {"state": "Querétaro", "abreviation": "QUE"},
    {"state": "Quintana Roo", "abreviation": "ROO"},
    {"state": "San Luis Potosí", "abreviation": "SLP"},
    {"state": "Sinaloa", "abreviation": "SIN"},
    {"state": "Sonora", "abreviation": "SON"},
    {"state": "Tabasco", "abreviation": "TAB"},
    {"state": "Tamaulipas", "abreviation": "TAM"},
    {"state": "Tlaxcala", "abreviation": "TLA"},
    {"state": "Veracruz", "abreviation": "VER"},
    {"state": "Yucatán", "abreviation": "YUC"},
    {"state": "Zacatecas", "abreviation": "ZAC"},
  ];

  static String getStateAbrevaition(String stateName) {
    List finalList = [];

    final List result =
        stateAbreviations.where((val) => val["state"] == stateName).toList();

    for (final val in result) {
      finalList.add(val["abreviation"]);
    }
    if (finalList.isNotEmpty) {
      return finalList[0];
    } else {
      return stateName;
    }
  }
}
