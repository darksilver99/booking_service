import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceListRecord extends FirestoreRecord {
  ServiceListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "start_price" field.
  int? _startPrice;
  int get startPrice => _startPrice ?? 0;
  bool hasStartPrice() => _startPrice != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "is_open" field.
  bool? _isOpen;
  bool get isOpen => _isOpen ?? false;
  bool hasIsOpen() => _isOpen != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _deleteBy = snapshotData['delete_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _rating = castToType<double>(snapshotData['rating']);
    _title = snapshotData['title'] as String?;
    _detail = snapshotData['detail'] as String?;
    _startPrice = castToType<int>(snapshotData['start_price']);
    _image = getDataList(snapshotData['image']);
    _location = snapshotData['location'] as LatLng?;
    _isOpen = snapshotData['is_open'] as bool?;
    _category = snapshotData['category'] as String?;
    _distance = castToType<double>(snapshotData['distance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service_list');

  static Stream<ServiceListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceListRecord.fromSnapshot(s));

  static Future<ServiceListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceListRecord.fromSnapshot(s));

  static ServiceListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  double? rating,
  String? title,
  String? detail,
  int? startPrice,
  LatLng? location,
  bool? isOpen,
  String? category,
  double? distance,
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
      'rating': rating,
      'title': title,
      'detail': detail,
      'start_price': startPrice,
      'location': location,
      'is_open': isOpen,
      'category': category,
      'distance': distance,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceListRecordDocumentEquality implements Equality<ServiceListRecord> {
  const ServiceListRecordDocumentEquality();

  @override
  bool equals(ServiceListRecord? e1, ServiceListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.deleteBy == e2?.deleteBy &&
        e1?.status == e2?.status &&
        e1?.rating == e2?.rating &&
        e1?.title == e2?.title &&
        e1?.detail == e2?.detail &&
        e1?.startPrice == e2?.startPrice &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.location == e2?.location &&
        e1?.isOpen == e2?.isOpen &&
        e1?.category == e2?.category &&
        e1?.distance == e2?.distance;
  }

  @override
  int hash(ServiceListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.deleteDate,
        e?.deleteBy,
        e?.status,
        e?.rating,
        e?.title,
        e?.detail,
        e?.startPrice,
        e?.image,
        e?.location,
        e?.isOpen,
        e?.category,
        e?.distance
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceListRecord;
}
