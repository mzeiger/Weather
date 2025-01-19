// Open Weather
const String appId = "69e5a529e466a5f77d073075632dbc13";
const String urlPrefix =
    "https://api.openweathermap.org/data/2.5/weather?units=imperial&";
const String zipUrl =
    "https://api.openweathermap.org/data/2.5/weather?appid=69e5a529e466a5f77d073075632dbc13&units=imperial&zip=";
const String cityUrl =
    "https://api.openweathermap.org/data/2.5/weather?appid=69e5a529e466a5f77d073075632dbc13&units=imperial&q=";

const String oneCallUrlPrefix =
    'https://api.openweathermap.org/data/3.0/onecall?exclude=minutely,hourly,daily,alerts&units=imperial';

// don't forget to add the .png at the end of the icon name
const String iconUrl = "https://openweathermap.org/img/wn/";

// add  lat={lat}&lon={lon}' to end
const String locationUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=3a8597165e9fca99a42f17b48547a554&units=imperial&';

// visual crossing appId
// To form url: url = 'vcLatLonUrl_1${lat},${lon}keyForUrl'
const String vcKey = 'S5C4BVLDLCF9VK4HREF57Z6WR';
const String vcLatLonUrl_1 =
    'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';

const String vcZip =
    'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/80921/2024-11-27?key=S5C4BVLDLCF9VK4HREF57Z6WR&include=current,days';

const String keyForUrl = '?key=S5C4BVLDLCF9VK4HREF57Z6WR';

// Sunrise & sunset Url
const String sunrisSunsetUrl =
    'https://api.sunrisesunset.io/json?'; // ad lat={latitude}&lng={longitude}
