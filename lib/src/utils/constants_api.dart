const BASE_URL = "https://5e82b12978337f00160ae4c5.mockapi.io/mock/";

const LESSONSTUTORIAL = "lesson_tutorial";
const LESSONSLEVEL = "lesson_level";
const LESSONSAUDIO = "lesson_audio";
const LESSONSVIDEO = "lesson_video";
const LESSONSMIXER = "lesson_mixer";

const LIMIT = 20;

String getUrl(String tabName, int page, int limit) {
  String url = "$BASE_URL";
  switch (tabName) {
    case LESSONSTUTORIAL:
      url = url + LESSONSTUTORIAL;
      break;
    case LESSONSLEVEL:
      url = url + LESSONSLEVEL;
      break;
    case LESSONSAUDIO:
      url = url + LESSONSAUDIO;
      break;
    case LESSONSVIDEO:
      url = url + LESSONSVIDEO;
      break;
    case LESSONSMIXER:
      url = url + LESSONSMIXER;
      break;
    default:
  }
  url = "$url?page=$page&limit=$limit";
  return url;
}
