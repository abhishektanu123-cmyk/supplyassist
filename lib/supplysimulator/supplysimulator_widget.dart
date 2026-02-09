import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'supplysimulator_model.dart';
export 'supplysimulator_model.dart';

/// Design a high-fidelity 'Supplier X Simulator' mobile page with a
/// professional dark theme (#121212).
///
/// Top Header: Deep red gradient 'CRITICAL' alert box with a pulsing bell
/// icon and white 'Warsaw DC' text. Below it, add a countdown timer '12 hours
/// until stockout' with a horizontal segmented progress bar in orange/red.
///
/// Content Cards: Two main white-grey containers for 'SKU STATUS' and
/// 'DISTRIBUTION CENTERS'. Each list item must have: Title text, a Row
/// containing a 10-segment color-coded status bar (Red/Yellow/Green
/// segments), and a percentage label with a chevron arrow.
///
/// Action Bar: A horizontal Row of three large rounded buttons: 'EXPEDITE'
/// (Dark Green), 'BACKUP' (Golden Yellow), and 'BOTH' (Deep Blue).
///
/// Impact Section: Bottom light-grey card titled 'IMPACT RESULT' with bullet
/// points for 'Service Level' and 'Stockout Risk' using green/red up-down
/// arrows.
///
/// Style: Dark background, high-contrast white/yellow text, and clean 12px
/// rounded corners for all containers.
class SupplysimulatorWidget extends StatefulWidget {
  const SupplysimulatorWidget({super.key});

  static String routeName = 'supplysimulator';
  static String routePath = '/supplysimulator';

  @override
  State<SupplysimulatorWidget> createState() => _SupplysimulatorWidgetState();
}

class _SupplysimulatorWidgetState extends State<SupplysimulatorWidget>
    with TickerProviderStateMixin {
  late SupplysimulatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplysimulatorModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'progressBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(SimulationPageWidget.routeName);
            },
          ),
          title: Text(
            'SupplierResult',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Color(0xFF0A0A0A),
                  fontSize: 28.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFCC0000), Color(0xFF8B0000)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.notifications_active,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                Text(
                                  'CRITICAL',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Text(
                              'Warsaw DC',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6F3FC),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircularPercentIndicator(
                              percent: 0.0,
                              radius: 60.0,
                              lineWidth: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              center: Text(
                                '62%',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'progressBarOnPageLoadAnimation']!),
                            Text(
                              '12 hours until stockout',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFFFCC00),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF333333),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF6600),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        Container(
                                          width: 40.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFCC0000),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6F3FC),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'SKU STATUS',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF121212),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Product A - High Priority',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '67%',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF121212),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF666666),
                                              size: 16.0,
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Color(0xFFDDDDDD),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Product B - Medium Priority',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '84%',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF121212),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF666666),
                                              size: 16.0,
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation3']!),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6F3FC),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'DISTRIBUTION CENTERS',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF121212),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Warsaw Main Hub',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFCC0000),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '72%',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF121212),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF666666),
                                              size: 16.0,
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Color(0xFFDDDDDD),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Krakow Regional',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF6600),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                            Container(
                                              width: 12.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF00CC00),
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '91%',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF121212),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF666666),
                                              size: 16.0,
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation4']!),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'EXPEDITE',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 56.0,
                              padding: EdgeInsets.all(15.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF006600),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation1']!),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'BACKUP',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 56.0,
                              padding: EdgeInsets.all(15.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFFFCC00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF121212),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation2']!),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'BOTH',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 56.0,
                              padding: EdgeInsets.all(15.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF003366),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation3']!),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6F3FC),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'IMPACT RESULT',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF121212),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      color: Color(0xFF00CC00),
                                      size: 20.0,
                                    ),
                                    Text(
                                      'Service Level: 94.2%',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.trending_down,
                                      color: Color(0xFFCC0000),
                                      size: 20.0,
                                    ),
                                    Text(
                                      'Stockout Risk: High',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF121212),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation5']!),
                  ),
                ]
                    .divide(SizedBox(height: 16.0))
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
