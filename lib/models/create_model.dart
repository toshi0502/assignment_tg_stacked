class CreateScgedule {
  String? date;
  String? time;
  String? docName;
  int? onlineMeeting;
  String? emailCc;

  CreateScgedule(
      {this.date, this.time, this.docName, this.onlineMeeting, this.emailCc});

  CreateScgedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    docName = json['doc_name'];
    onlineMeeting = json['online_meeting'];
    emailCc = json['email_cc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['doc_name'] = this.docName;
    data['online_meeting'] = this.onlineMeeting;
    data['email_cc'] = this.emailCc;
    return data;
  }
}
