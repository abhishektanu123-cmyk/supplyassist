import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpage_model.dart';
export 'loginpage_model.dart';

class LoginpageWidget extends StatefulWidget {
  const LoginpageWidget({super.key});

  static String routeName = 'loginpage';
  static String routePath = '/loginpage';

  @override
  State<LoginpageWidget> createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget>
    with TickerProviderStateMixin {
  late LoginpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginpageModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.passwordTextController ??= TextEditingController();

    animationsMap.addAll({
      'columnOnPageLoad': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(duration: 400.ms),
          MoveEffect(
            begin: Offset(0, 40),
            end: Offset(0, 0),
            duration: 400.ms,
          ),
        ],
      ),
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _handleEmailLogin() async {
    final email = _model.emailAddressTextController.text.trim();
    final password = _model.passwordTextController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter email and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    GoRouter.of(context).prepareAuthEvent();

    final user = await authManager.signInWithEmail(
      context,
      email,
      password,
    );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.goNamedAuth(
      HomePageWidget.routeName,
      context.mounted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                // HEADER
                Container(
                  height: 260,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).tertiary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping,
                          size: 72, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        'Supply Assist',
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // FORM
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _model.emailAddressTextController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _model.passwordTextController,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),

                      // SIGN IN BUTTON
                      FFButtonWidget(
                        onPressed: _handleEmailLogin,
                        text: 'Sign In',
                        options: FFButtonOptions(
                          height: 44,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .copyWith(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Center(child: Text('Or sign in with')),

                      const SizedBox(height: 16),

                      // GOOGLE SIGN IN
                      FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          final user =
                          await authManager.signInWithGoogle(context);
                          if (user == null) return;

                          context.goNamedAuth(
                            HomePageWidget.routeName,
                            context.mounted,
                          );
                        },
                        text: 'Continue with Google',
                        icon: FaIcon(FontAwesomeIcons.google),
                        options: FFButtonOptions(
                          height: 44,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          borderSide:
                          BorderSide(color: FlutterFlowTheme.of(context).alternate),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                    animationsMap['columnOnPageLoad']!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
