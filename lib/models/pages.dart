class Page {
  String pid; // page id
  String name;
  String imageUrl;
  Map<String, String> generalInfo;
  String text;

  Page({this.pid, this.name, this.imageUrl, this.generalInfo, this.text});

  Map<String, dynamic> toMap() {
    return {
      "pid": pid,
      "name": name,
      "text": text,
      "url": imageUrl,
      "general_info": generalInfo,
    };
  }

  factory Page.fromMap(Map<String, dynamic> map) {
    return Page(
      pid: map["pid"] as String,
      name: map["name"] as String,
      text: map["text"] as String,
      imageUrl: map["url"],
      generalInfo: map["general_info"],
    );
  }
}
