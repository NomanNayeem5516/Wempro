class info {
  String? message;
  String? instruction;

  info({this.message, this.instruction});

  info.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    instruction = json['instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['instruction'] = this.instruction;
    return data;
  }
}
