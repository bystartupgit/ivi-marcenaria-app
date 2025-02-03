


class CoverUtils {


  static String convertNameFile(String value) {

    if(value.contains("/")) { return value.split("/").last; }
    else { return value; }

  }

}