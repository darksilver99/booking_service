// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusTypeStruct extends FFFirebaseStruct {
  StatusTypeStruct({
    int? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static StatusTypeStruct fromMap(Map<String, dynamic> data) =>
      StatusTypeStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static StatusTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatusTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatusTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusTypeStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

StatusTypeStruct createStatusTypeStruct({
  int? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusTypeStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusTypeStruct? updateStatusTypeStruct(
  StatusTypeStruct? statusType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statusType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusTypeStructData(
  Map<String, dynamic> firestoreData,
  StatusTypeStruct? statusType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusType == null) {
    return;
  }
  if (statusType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statusType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusTypeData = getStatusTypeFirestoreData(statusType, forFieldValue);
  final nestedData = statusTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statusType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusTypeFirestoreData(
  StatusTypeStruct? statusType, [
  bool forFieldValue = false,
]) {
  if (statusType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statusType.toMap());

  // Add any Firestore field values
  statusType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusTypeListFirestoreData(
  List<StatusTypeStruct>? statusTypes,
) =>
    statusTypes?.map((e) => getStatusTypeFirestoreData(e, true)).toList() ?? [];
