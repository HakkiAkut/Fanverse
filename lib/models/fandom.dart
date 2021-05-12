
class Fandom {
  String fid; // fandom id
  String name; // fandom name
  String description;
  Map<String, dynamic> members; // user id of members
  Map<String, dynamic> admins;
  List<SubClasses> classes; // general titles like Kingdoms, Characters
  String imageUrl;

  Fandom(
      {this.fid,
      this.name,
      this.description,
      this.members,
      this.admins,
      this.classes,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      "fid": fid,
      "name": name,
      "description": description,
      "members": members,
      "admins": admins,
      "image": imageUrl,
    };
  }

  factory Fandom.fromMap(Map<String, dynamic> map) {
    return Fandom(
      fid: map["fid"] as String,
      name: map["name"] as String,
      description: map["description"] as String,
      members: map["members"],
      admins: map["admins"],
      imageUrl: map["image"] as String,
    );
  }
}

class SubClasses {
  String cid; // class id
  String name;
  List<Page> pages;
}

class Page {
  String pid; // page id
  String name;
  String imageUrl;
  Map<String, String> generalInfo;
  String text;
}
