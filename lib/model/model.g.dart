// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoDetailsBoxAdapter extends TypeAdapter<VideoDetailsBox> {
  @override
  final int typeId = 1;

  @override
  VideoDetailsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoDetailsBox(
      videoFilePath: fields[0] as String,
      thumbnailPath: fields[1] as dynamic,
      fav: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, VideoDetailsBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.videoFilePath)
      ..writeByte(1)
      ..write(obj.thumbnailPath)
      ..writeByte(2)
      ..write(obj.fav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoDetailsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
