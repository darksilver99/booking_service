import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingListRecord extends FirestoreRecord {
  BookingListRecord._(
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

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "delete_by" field.
  DocumentReference? _deleteBy;
  DocumentReference? get deleteBy => _deleteBy;
  bool hasDeleteBy() => _deleteBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "service_ref" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "booking_date" field.
  DateTime? _bookingDate;
  DateTime? get bookingDate => _bookingDate;
  bool hasBookingDate() => _bookingDate != null;

  // "user_detail" field.
  String? _userDetail;
  String get userDetail => _userDetail ?? '';
  bool hasUserDetail() => _userDetail != null;

  // "owner_detail" field.
  String? _ownerDetail;
  String get ownerDetail => _ownerDetail ?? '';
  bool hasOwnerDetail() => _ownerDetail != null;

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _serviceRef = snapshotData['service_ref'] as DocumentReference?;
    _bookingDate = snapshotData['booking_date'] as DateTime?;
    _userDetail = snapshotData['user_detail'] as String?;
    _ownerDetail = snapshotData['owner_detail'] as String?;
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking_list');

  static Stream<BookingListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingListRecord.fromSnapshot(s));

  static Future<BookingListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingListRecord.fromSnapshot(s));

  static BookingListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  DocumentReference? serviceRef,
  DateTime? bookingDate,
  String? userDetail,
  String? ownerDetail,
  DocumentReference? ownerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'delete_date': deleteDate,
      'delete_by': deleteBy,
      'status': status,
      'service_ref': serviceRef,
      'booking_date': bookingDate,
      'user_detail': userDetail,
      'owner_detail': ownerDetail,
      'owner_ref': ownerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingListRecordDocumentEquality implements Equality<BookingListRecord> {
  const BookingListRecordDocumentEquality();

  @override
  bool equals(BookingListRecord? e1, BookingListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.serviceRef == e2?.serviceRef &&
        e1?.bookingDate == e2?.bookingDate &&
        e1?.userDetail == e2?.userDetail &&
        e1?.ownerDetail == e2?.ownerDetail &&
        e1?.ownerRef == e2?.ownerRef;
  }

  @override
  int hash(BookingListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.serviceRef,
        e?.bookingDate,
        e?.userDetail,
        e?.ownerDetail,
        e?.ownerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingListRecord;
}
