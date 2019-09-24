import 'dart:convert';

class Event{
  int event_id;
  String event_title;
  String event_description;
  String image_url;
  String created_date;

  Event({
    this.event_id = 0, 
    this.event_title, 
    this.event_description,
    this.image_url, 
    this.created_date
    });

  factory Event.fromJson(Map<String, dynamic> map) {
    return Event(
        event_id: map["event_id"], 
        event_title: map["event_title"], 
        event_description: map["event_description"], 
        image_url: map["image_url"],
        created_date: map["created_date"]
        );
  }

   Map<String, dynamic> toJson() {
    return {
      "event_id": event_id, 
      "event_title": event_title, 
      "event_description": event_description, 
      "image_url": image_url, 
      "created_date":created_date
      };
  }

    @override
  String toString() {
    return 'Event{event_id: $event_id, event_title: $event_title, event_description: $event_description, image_url: $image_url, created_date:$created_date}';
  }

}

List<Event> eventFromJson(String jsonData) {
  final result = json.decode(jsonData);
  var   data   = result['data'];
  // print(result['data']);
  return List<Event>.from(data.map((item) => Event.fromJson(item)));
}

String eventToJson(Event data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}