const BASE_URL = "https://5e82b12978337f00160ae4c5.mockapi.io/mock/";

const TABTUTORIAL = "lesson_tutorial";
const TABLEVEL = "lesson_level";
const TABAUDIO = "lesson_audio";
const TABVIDEO = "lesson_video";
const TABMIXER = "lesson_mixer";

const LIMIT = 20;

String getUrl(String tabName, int page, int limit) {
  String url = "$BASE_URL";
  switch (tabName) {
    case TABTUTORIAL:
      url = url + TABTUTORIAL;
      break;
    case TABLEVEL:
      url = url + TABLEVEL;
      break;
    case TABAUDIO:
      url = url + TABAUDIO;
      break;
    case TABVIDEO:
      url = url + TABVIDEO;
      break;
    case TABMIXER:
      url = url + TABMIXER;
      break;
    default:
  }
  url = "$url?page=$page&limit=$limit";
  return url;
}

String getUrlByTabname(String tabName) {
  String url = "$BASE_URL";
  switch (tabName) {
    case TABTUTORIAL:
      url = url + TABTUTORIAL;
      break;
    case TABLEVEL:
      url = url + TABLEVEL;
      break;
    case TABAUDIO:
      url = url + TABAUDIO;
      break;
    case TABVIDEO:
      url = url + TABVIDEO;
      break;
    case TABMIXER:
      url = url + TABMIXER;
      break;
    default:
  }
  return url;
}
