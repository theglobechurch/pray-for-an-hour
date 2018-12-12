class PrayersList {
  final List<Prayer> prayers;

  PrayersList({
    this.prayers,
  });

  factory PrayersList.fromJson(List<dynamic> parsedJson) {
    List<Prayer> prayers = new List<Prayer>();
    prayers = parsedJson.map((i)=>Prayer.fromJson(i)).toList();

    return new PrayersList(
      prayers: prayers,
    );
  }
}

class Prayer {
  final String name;
  final String body;

  Prayer({
    this.name,
    this.body,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return new Prayer(
      name: json['name'],
      body: json['body'],
    );
  }
}
