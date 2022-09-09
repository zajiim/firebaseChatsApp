enum MessageEnum {
  text('text'),
  gif('gif'),
  image('image'),
  audio('audio'),
  video('video');

  const MessageEnum(this.type);
  final String type;
}

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'text':
        return MessageEnum.text;
      case 'gif':
        return MessageEnum.gif;
      case 'image':
        return MessageEnum.image;
      case 'audio':
        return MessageEnum.audio;
      case 'video':
        return MessageEnum.video;
      default:
        return MessageEnum.text;
    }
  }
}
