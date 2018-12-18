class PrayersList {
  final List<Prayer> prayers;

  PrayersList({
    this.prayers,
  });

  factory PrayersList.fromJson(List<dynamic> parsedJson) {
    List<Prayer> prayers = new List<Prayer>();
    prayers = parsedJson.map((i)=>Prayer.fromJson(i)).toList();
    print(prayers);

    return new PrayersList(
      prayers: prayers,
    );
  }
}

class Prayer {
  final String name;
  final List<PrayerContent> prayerContents;

  Prayer({
    this.name,
    this.prayerContents,
  });

  factory Prayer.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['content'] as List;
    List<PrayerContent> contentList = list.map((i) => PrayerContent.fromJson(i)).toList();

    return new Prayer(
      name: parsedJson['name'],
      prayerContents: contentList
    );
  }
}

class PrayerContent {
  final String type;
  final String body;
  final String reference;

  PrayerContent({
    this.type,
    this.body,
    this.reference
  });


  factory PrayerContent.fromJson(Map<String, dynamic> parsedJson) {
    return new PrayerContent(
      type: parsedJson['type'],
      body: parsedJson['body'],
      reference: parsedJson['reference'],
    );
  }
}
