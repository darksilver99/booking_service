import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewListRecord extends FirestoreRecord {
  ReviewListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "service_ref" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "star" field.
  double? _star;
  double get star => _star ?? 0.0;
  bool hasStar() => _star != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _serviceRef = snapshotData['service_ref'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _star = castToType<double>(snapshotData['star']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review_list');

  static Stream<ReviewListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewListRecord.fromSnapshot(s));

  static Future<ReviewListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewListRecord.fromSnapshot(s));

  static ReviewListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  DocumentReference? serviceRef,
  String? comment,
  double? star,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'service_ref': serviceRef,
      'comment': comment,
      'star': star,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewListRecordDocumentEquality implements Equality<ReviewListRecord> {
  const ReviewListRecordDocumentEquality();

  @override
  bool equals(ReviewListRecord? e1, ReviewListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.serviceRef == e2?.serviceRef &&
        e1?.comment == e2?.comment &&
        e1?.star == e2?.star;
  }

  @override
  int hash(ReviewListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.serviceRef,
        e?.comment,
        e?.star
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewListRecord;
}
