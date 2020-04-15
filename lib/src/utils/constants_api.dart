const BASE_URL = "https://5e82b12978337f00160ae4c5.mockapi.io/mock/";

const TABTUTORIAL = "lesson_tutorial";
const TABLEVEL = "lesson_level";
const TABAUDIO = "lesson_audio";
const TABVIDEO = "lesson_video";
const TABMIXER = "lesson_mixer";

const LIMIT = 20;


String getUrl(String name) {
  String url = "$BASE_URL";
  switch (name) {
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
