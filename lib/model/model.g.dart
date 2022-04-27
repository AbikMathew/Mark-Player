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

class PlaylistBoxAdapter extends TypeAdapter<PlaylistBox> {
  @override
  final int typeId = 3;

  @override
  PlaylistBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistBox(
      playlistName: fields[0] as String,
      plVideoPath: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.playlistName)
      ..writeByte(1)
      ..write(obj.plVideoPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IndividualPlaylistBoxAdapter extends TypeAdapter<IndividualPlaylistBox> {
  @override
  final int typeId = 4;

  @override
  IndividualPlaylistBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IndividualPlaylistBox(
      id: fields[0] as String,
      plAddedVideoPath: fields[1] as String,
      plAddedThumbnail: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, IndividualPlaylistBox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.plAddedVideoPath)
      ..writeByte(2)
      ..write(obj.plAddedThumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndividualPlaylistBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
