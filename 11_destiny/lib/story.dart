class Story {
  late String storyTitle;
  late String choice1;
  late String choice2;

  // the keyword 'required' added because we made this constructor as {named params} therefore it can't be null
  Story(
      {required this.storyTitle, required this.choice1, required this.choice2});
}
