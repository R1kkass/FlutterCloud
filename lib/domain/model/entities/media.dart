import 'package:TalkSpace/gen/dart/file/file.pb.dart' as filepb;

class Media {
  String uuid;
  String name;
  String collectionName;
  String mimeType;
  int size;
  String fileName;
  String extension;
  String customProperties;
  String modelType;
  int modelId;

  Media({
    required this.uuid,
    required this.name,
    required this.collectionName,
    required this.mimeType,
    required this.size,
    required this.fileName,
    required this.extension,
    required this.customProperties,
    required this.modelType,
    required this.modelId,
  });

  static Media fromGrpc(filepb.Media media) {
    return Media(
        uuid: media.uuid,
        name: media.name,
        collectionName: media.collectionName,
        mimeType: media.mimeType,
        size: media.size.toInt(),
        fileName: media.fileName,
        extension: media.extension_7,
        customProperties: media.customProperties,
        modelType: media.modelType,
        modelId: media.modelId
    );
  }
}