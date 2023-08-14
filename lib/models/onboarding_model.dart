class OnbordingModel {
  String? image;
  String? title;
  String? discription;

  OnbordingModel({
    this.image,
    this.title,
    this.discription,
  });

  static List<OnbordingModel> contents = [
    OnbordingModel(
      title: 'Quality Food',
      image: 'assets/svg/quality.svg',
      discription:
          "Simply dummy text of the printing and typesetting industry.",
    ),
    OnbordingModel(
      title: 'Fast Delevery',
      image: 'assets/svg/delevery.svg',
      discription: "Industry's standard dummy text ever since the 1500s.",
    ),
    OnbordingModel(
      title: 'Reward',
      image: 'assets/svg/reward.svg',
      discription:
          "When an unknown printer took a galley of type and scrambled it.",
    ),
  ];
}
