import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryListRecord extends FirestoreRecord {
  CategoryListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = castToType<int>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category_list');

  static Stream<CategoryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryListRecord.fromSnapshot(s));

  static Future<CategoryListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryListRecord.fromSnapshot(s));

  static CategoryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryListRecordData({
  String? name,
  int? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryListRecordDocumentEquality
    implements Equality<CategoryListRecord> {
  const CategoryListRecordDocumentEquality();

  @override
  bool equals(CategoryListRecord? e1, CategoryListRecord? e2) {
    return e1?.name == e2?.name && e1?.status == e2?.status;
  }

  @override
  int hash(CategoryListRecord? e) =>
      const ListEquality().hash([e?.name, e?.status]);

  @override
  bool isValidKey(Object? o) => o is CategoryListRecord;
}
