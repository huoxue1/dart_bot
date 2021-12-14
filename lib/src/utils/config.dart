class Config {
  String address = "127.0.0.1";
  int port = 8080;
  String token = "";

  Config({required this.address, required this.port});
  Config.setToken(
      {required this.address, required this.port, required this.token});

  Config.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    port = json['port'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['port'] = port;
    data['token'] = token;
    return data;
  }
}
