// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlemodelAdapter extends TypeAdapter<Articlemodel> {
  @override
  final int typeId = 1;

  @override
  Articlemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Articlemodel(
      author: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      urlToImage: fields[4] as String?,
      publishedAt: fields[5] as DateTime?,
      content: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Articlemodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage)
      ..writeByte(5)
      ..write(obj.publishedAt)
      ..writeByte(6)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
