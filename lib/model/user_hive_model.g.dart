// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 1;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      userId: fields[0] as dynamic,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String?,
      token: fields[5] as String?,
      phoneNumber: fields[4] as String?,
      middleName: fields[6] as String?,
      userName: fields[10] as String?,
      countryCode: fields[8] as String?,
      gender: fields[9] as String?,
      hasBiometric: fields[11] as bool?,
      isLoggedIn: fields[12] as bool?,
      houseNumber: fields[13] as String?,
      streetName: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.token)
      ..writeByte(6)
      ..write(obj.middleName)
      ..writeByte(8)
      ..write(obj.countryCode)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.userName)
      ..writeByte(11)
      ..write(obj.hasBiometric)
      ..writeByte(12)
      ..write(obj.isLoggedIn)
      ..writeByte(14)
      ..write(obj.streetName)
      ..writeByte(13)
      ..write(obj.houseNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
