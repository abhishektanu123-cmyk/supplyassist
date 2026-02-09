import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuppliersRecord extends FirestoreRecord {
  SuppliersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "riskScore" field.
  int? _riskScore;
  int get riskScore => _riskScore ?? 0;
  bool hasRiskScore() => _riskScore != null;

  // "riskLevel" field.
  String? _riskLevel;
  String get riskLevel => _riskLevel ?? '';
  bool hasRiskLevel() => _riskLevel != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "availability" field.
  int? _availability;
  int get availability => _availability ?? 0;
  bool hasAvailability() => _availability != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _riskScore = castToType<int>(snapshotData['riskScore']);
    _riskLevel = snapshotData['riskLevel'] as String?;
    _country = snapshotData['country'] as String?;
    _availability = castToType<int>(snapshotData['availability']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Suppliers');

  static Stream<SuppliersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuppliersRecord.fromSnapshot(s));

  static Future<SuppliersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuppliersRecord.fromSnapshot(s));

  static SuppliersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuppliersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuppliersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuppliersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuppliersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuppliersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuppliersRecordData({
  String? name,
  int? riskScore,
  String? riskLevel,
  String? country,
  int? availability,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'riskScore': riskScore,
      'riskLevel': riskLevel,
      'country': country,
      'availability': availability,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuppliersRecordDocumentEquality implements Equality<SuppliersRecord> {
  const SuppliersRecordDocumentEquality();

  @override
  bool equals(SuppliersRecord? e1, SuppliersRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.riskScore == e2?.riskScore &&
        e1?.riskLevel == e2?.riskLevel &&
        e1?.country == e2?.country &&
        e1?.availability == e2?.availability &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(SuppliersRecord? e) => const ListEquality().hash([
        e?.name,
        e?.riskScore,
        e?.riskLevel,
        e?.country,
        e?.availability,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is SuppliersRecord;
}
