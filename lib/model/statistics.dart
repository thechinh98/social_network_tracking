class Statistics {
  final num viewCount;
  final num subscriberCount;
  final num hiddenSubscriberCount;
  final num videoCount;

  Statistics({
    this.viewCount = 0,
    this.subscriberCount = 0,
    this.hiddenSubscriberCount = 0,
    this.videoCount = 0,
  });
  factory Statistics.fromMap(Map<String, dynamic> map) {
    return Statistics(
      videoCount: map['videoCount'],
      subscriberCount: map['subscriberCount'],
      hiddenSubscriberCount: map['hiddenSubscriberCount'],
      viewCount: map['viewCount'],
    );
  }
}
