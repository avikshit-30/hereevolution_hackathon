class URLs {
  static const String serverUrl = "https://apogee-hackathon.vercel.app/";

  static String complete(String local) {
    return serverUrl + local;
  }
}
