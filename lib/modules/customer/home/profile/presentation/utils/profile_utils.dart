


class ProfileUtils {


  static String initalLetters(String value) {

    if(value.isEmpty) { return "-"; }

    List<String> name = value.split(" ");


    if(name.length > 2) { String result = name[0][0] + name[1][0]; return result.toUpperCase(); }
    else { return (value[0] + value.substring(value.length - 1)).toUpperCase();  }


  }

}