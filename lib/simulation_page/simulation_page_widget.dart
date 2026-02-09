import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'simulation_page_model.dart';
export 'simulation_page_model.dart';

import 'package:supply_assist/services/simulation_result_service.dart';
import 'package:supply_assist/disruptionimpact/disruptionimpact_widget.dart';

class SimulationPageWidget extends StatefulWidget {
  const SimulationPageWidget({super.key});

  static String routeName = 'SimulationPage';
  static String routePath = '/simulationPage';

  @override
  State<SimulationPageWidget> createState() => _SimulationPageWidgetState();
}

class _SimulationPageWidgetState extends State<SimulationPageWidget>
    with TickerProviderStateMixin {
  late SimulationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  bool _loadingSuppliers = true;
  List<String> _supplierNames = [];
  Map<String, Map<String, dynamic>> _suppliers = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimulationPageModel());
    _loadSuppliers();
  }

  Future<void> _loadSuppliers() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('suppliers').get();

    for (final doc in snapshot.docs) {
      final data = Map<String, dynamic>.from(doc.data());
      _supplierNames.add(data['name']);
      _suppliers[data['name']] = data;
    }

    setState(() => _loadingSuppliers = false);
  }

  void _resetSimulation() {
    setState(() {
      _model.choiceChipsValue = 'Medium';
      _model.dropDownValue = null;
      _model.choiceChipsValueController?.reset();
      _model.dropDownValueController?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              FlutterFlowIconButton(
                buttonSize: 40,
                icon: Icon(Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText),
                onPressed: () => context.pop(),
              ),

              const SizedBox(height: 24),

              Text(
                'Supply Disruption Simulation',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 32),

              /// 🔥 INTENSITY
              Text(
                'Simulation Intensity',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),

              const SizedBox(height: 12),

              FlutterFlowChoiceChips(
                options: const [
                  ChipData('High'),
                  ChipData('Medium'),
                  ChipData('Low'),
                ],
                onChanged: (val) =>
                    setState(() => _model.choiceChipsValue = val?.first),
                controller: _model.choiceChipsValueController ??=
                    FormFieldController(['Medium']),
                multiselect: false,
                wrapped: true,
                chipSpacing: 12,
                rowSpacing: 12,
                selectedChipStyle: ChipStyle(
                  backgroundColor: Colors.white,
                  borderColor: const Color(0xFF0052CC),
                  borderWidth: 2,
                  borderRadius: BorderRadius.circular(12),
                  textStyle: FlutterFlowTheme.of(context)
                      .titleSmall
                      .copyWith(color: Colors.black),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                  textStyle: FlutterFlowTheme.of(context)
                      .titleSmall
                      .copyWith(color: const Color(0xFF666666)),
                ),
              ),

              const SizedBox(height: 32),

              /// 🏭 SUPPLIER
              Text(
                'Choose Supplier',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),

              const SizedBox(height: 12),

              _loadingSuppliers
                  ? const CircularProgressIndicator()
                  : FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController(null),
                options: _supplierNames,
                onChanged: (val) =>
                    setState(() => _model.dropDownValue = val),
                width: double.infinity,
                height: 50,
                textStyle: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .copyWith(color: Colors.black),
                hintText: 'Select supplier',
                icon: const Icon(Icons.keyboard_arrow_down),
                fillColor: const Color(0xFFF5F5F5),
                elevation: 0,
                borderWidth: 1,
                borderColor: const Color(0xFFF5F5F5),
                borderRadius: 12,
                margin:
                const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                hidesUnderline: true,
                isSearchable: true,
              ),

              const Spacer(),

              /// ▶️ ACTION
              FFButtonWidget(
                text: 'Simulate',
                onPressed: () {
                  if (_model.dropDownValue == null) return;

                  final supplier = _suppliers[_model.dropDownValue]!;

                  context.read<SimulationResultService>().runSimulation(
                    supplierName: supplier['name'],
                    sku: supplier['sku'] ?? 'N/A',
                    country: supplier['country'], // ✅ country → location
                    baseAvailability:
                    (supplier['availability'] ?? 100) / 100,
                    intensity: _model.choiceChipsValue ?? 'Medium',
                  );

                  context.pushNamed(DisruptionimpactWidget.routeName);
                },
                options: FFButtonOptions(
                  height: 50,
                  color: const Color(0xFF0052CC),
                  borderRadius: BorderRadius.circular(12),
                  textStyle: FlutterFlowTheme.of(context)
                      .titleSmall
                      .copyWith(color: Colors.white),
                ),
              ),

              const SizedBox(height: 12),

              FFButtonWidget(
                text: 'Reset',
                onPressed: _resetSimulation,
                options: FFButtonOptions(
                  height: 50,
                  color: Colors.white,
                  borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
                  borderRadius: BorderRadius.circular(12),
                  textStyle: FlutterFlowTheme.of(context)
                      .titleSmall
                      .copyWith(color: const Color(0xFF666666)),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
