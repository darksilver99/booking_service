import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentHistoryListRecord extends FirestoreRecord {
  PaymentHistoryListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "payment_order" field.
  String? _paymentOrder;
  String get paymentOrder => _paymentOrder ?? '';
  bool hasPaymentOrder() => _paymentOrder != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _amount = castToType<int>(snapshotData['amount']);
    _paymentType = snapshotData['payment_type'] as String?;
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _paymentOrder = snapshotData['payment_order'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_history_list');

  static Stream<PaymentHistoryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentHistoryListRecord.fromSnapshot(s));

  static Future<PaymentHistoryListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PaymentHistoryListRecord.fromSnapshot(s));

  static PaymentHistoryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentHistoryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentHistoryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentHistoryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentHistoryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentHistoryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentHistoryListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  int? amount,
  String? paymentType,
  DateTime? paymentDate,
  String? paymentOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'amount': amount,
      'payment_type': paymentType,
      'payment_date': paymentDate,
      'payment_order': paymentOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentHistoryListRecordDocumentEquality
    implements Equality<PaymentHistoryListRecord> {
  const PaymentHistoryListRecordDocumentEquality();

  @override
  bool equals(PaymentHistoryListRecord? e1, PaymentHistoryListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.amount == e2?.amount &&
        e1?.paymentType == e2?.paymentType &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.paymentOrder == e2?.paymentOrder;
  }

  @override
  int hash(PaymentHistoryListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.amount,
        e?.paymentType,
        e?.paymentDate,
        e?.paymentOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentHistoryListRecord;
}
