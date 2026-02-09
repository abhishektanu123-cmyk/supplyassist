import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/supplier.dart';
import '../services/supplier_service.dart';

enum RiskFilter { all, high, medium, low }

class SupplierdashboardWidget extends StatefulWidget {
  const SupplierdashboardWidget({super.key});

  static const String routeName = 'supplierdashboard';
  static const String routePath = '/supplierdashboard';

  @override
  State<SupplierdashboardWidget> createState() =>
      _SupplierdashboardWidgetState();
}

class _SupplierdashboardWidgetState extends State<SupplierdashboardWidget> {
  RiskFilter selectedFilter = RiskFilter.all;

  @override
  void initState() {
    super.initState();
    // 🔥 LOAD SUPPLIERS WHEN PAGE OPENS
    Future.microtask(() {
      context.read<SupplierService>().loadSuppliers();
    });
  }

  Color riskColor(int risk) {
    if (risk >= 70) return const Color(0xFFE53935); // Red
    if (risk >= 40) return const Color(0xFFFFB300); // Yellow
    return const Color(0xFF43A047); // Green
  }

  bool matchesFilter(Supplier s) {
    switch (selectedFilter) {
      case RiskFilter.high:
        return s.riskScore >= 70;
      case RiskFilter.medium:
        return s.riskScore >= 40 && s.riskScore < 70;
      case RiskFilter.low:
        return s.riskScore < 40;
      case RiskFilter.all:
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = context.watch<SupplierService>();

    if (service.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final suppliers = service.suppliers;
    final filteredSuppliers = suppliers.where(matchesFilter).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Supplier Risk Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          /// 🔹 FILTER BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                filterChip('All', RiskFilter.all),
                filterChip('High', RiskFilter.high),
                filterChip('Medium', RiskFilter.medium),
                filterChip('Low', RiskFilter.low),
              ],
            ),
          ),

          /// 🔹 SUPPLIER LIST
          Expanded(
            child: suppliers.isEmpty
                ? const Center(child: Text('No suppliers found'))
                : filteredSuppliers.isEmpty
                ? const Center(
              child: Text('No suppliers match this filter'),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredSuppliers.length,
              itemBuilder: (context, index) {
                final s = filteredSuppliers[index];
                final color = riskColor(s.riskScore);

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFEFEFEF),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x08000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      /// LEFT COLOR BAR
                      Container(
                        width: 6,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                        ),
                      ),

                      /// CONTENT
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(
                                s.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${s.country} • SKU: ${s.sku}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Availability: ${s.availability}%',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// RISK SCORE
                      Container(
                        width: 60,
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                        ),
                        child: Text(
                          '${s.riskScore}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 FILTER CHIP
  Widget filterChip(String label, RiskFilter filter) {
    final isSelected = selectedFilter == filter;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {
        setState(() => selectedFilter = filter);
      },
      selectedColor: Colors.black,
      backgroundColor: const Color(0xFFF2F2F2),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
