class AlarmModel {
    int id;
    int active;
    String dateActive;
    String repeat;
    int sound;
    int hasSound;
    String title;
    int duration;
    int postpone;
    int postponeTimes;

    AlarmModel({
        this.id,
        this.active,
        this.dateActive,
        this.repeat,
        this.sound,
        this.hasSound,
        this.title,
        this.duration,
        this.postpone,
        this.postponeTimes,
    });

    factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
        id: json["id"],
        active: json["active"],
        dateActive: json["dateActive"],
        repeat: json["repeat"],
        sound: json["sound"],
        hasSound: json["hasSound"],
        title: json["title"],
        duration: json["duration"],
        postpone: json["postpone"],
        postponeTimes: json["postponeTimes"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "dateActive": dateActive,
        "repeat": repeat,
        "sound": sound,
        "hasSound": hasSound,
        "title": title,
        "duration": duration,
        "postpone": postpone,
        "postponeTimes": postponeTimes,
    };
}