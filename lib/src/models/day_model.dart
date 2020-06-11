class Days {
  List<Day> items = new List();
  
  Days();

  Days.fromList(List<dynamic> days) {

    if(days == null) return;
    for (var item in days) {
      final day = Day.fromJsonMap(item);
      items.add(day);      
    }
  }

}

class Day {
  String day;
  bool selected;

  Day({
    this.day,
    this.selected
  });

  Day.fromJsonMap(Map<String, dynamic> json) {
    day = json['day'];
    selected = json['selected'];
  }
  
}