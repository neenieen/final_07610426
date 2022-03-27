class AnimalItem {
  final dynamic choice_list;
  final String image_url;
  final int answer;


  AnimalItem({
    required this.choice_list,
    required this.image_url,
    required this.answer,

  });

  factory AnimalItem.fromJson(Map<String, dynamic> json) {
    return AnimalItem(
      choice_list: json['choice_list'],
      image_url: json['image_url'],
      answer: json['answer'],


    );
  }

  AnimalItem.fromJson2(Map<String, dynamic> json)
      : choice_list = json['choice_list'],
        image_url = json['image_url'],
        answer = json['answer'];


  @override
  String toString() {
    return '$image_url: $answer ราคา $choice_list บาท';
  }
}
