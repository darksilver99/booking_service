import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryListRecord extends FirestoreRecord {
  CategoryListRecord._(
    super.reference,
    super.data,
  ) {
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _image = snapshotData['image'] as String?;
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
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryListRecordDocumentEquality
    implements Equality<CategoryListRecord> {
  const CategoryListRecordDocumentEquality();

  @override
  bool equals(CategoryListRecord? e1, CategoryListRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CategoryListRecord? e) =>
      const ListEquality().hash([e?.name, e?.status, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CategoryListRecord;
}
