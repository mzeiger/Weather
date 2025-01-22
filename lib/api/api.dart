// Open Weather
const String appId = '69e5a529e466a5f77d073075632dbc13';
const String urlPrefix =
    'https://api.openweathermap.org/data/2.5/weather?units=imperial&';
const String zipUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=69e5a529e466a5f77d073075632dbc13&units=imperial&zip=';
const String cityUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=69e5a529e466a5f77d073075632dbc13&units=imperial&q=';

const String oneCallUrlPrefix =
    'https://api.openweathermap.org/data/3.0/onecall?exclude=minutely,hourly,daily,alerts&units=imperial';

// don't forget to add the .png at the end of the icon name
const String iconUrl = 'https://openweathermap.org/img/wn/';

// add  lat={lat}&lon={lon}' to end
const String locationUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=3a8597165e9fca99a42f17b48547a554&units=imperial&';

// visual crossing appId
const String vcLatLonUrl_1 =
    'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';
const String vcLatLonUrl_2 = '?unitGroup=us&include=days';
const String vcKey = '&key=S5C4BVLDLCF9VK4HREF57Z6WR';
// To form url: url = '$vcLatLonUrl_1${lat},${lon}$vcLatLonUrl_2$vcKey'

// Sunrise & sunset Url
const String sunrisSunsetUrl =
    'https://api.sunrisesunset.io/json?'; // ad lat={latitude}&lng={longitude}
