import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/supplier.dart';

class SupplierService extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  List<Supplier> _suppliers = [];
  bool _loading = false;

  List<Supplier> get suppliers => _suppliers;
  bool get isLoading => _loading;

  /// 🔥 MUST be called to load suppliers
  Future<void> loadSuppliers() async {
    _loading = true;
    notifyListeners();

    final snapshot = await _db.collection('suppliers').get();

    _suppliers = snapshot.docs.map((doc) {
      return Supplier.fromFirestore(doc.id, doc.data());
    }).toList();

    _loading = false;
    notifyListeners();

    debugPrint('✅ Loaded suppliers: ${_suppliers.length}');
  }
}
