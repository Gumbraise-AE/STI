import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().soundName == '') {
        _model.defaultSound = await SoundsTable().queryRows(
          queryFn: (q) => q.order('created_at', ascending: true),
        );
        FFAppState().soundName = _model.defaultSound!.first.name;
        setState(() {});
        return;
      } else {
        return;
      }
    });

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 150.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 150.0.ms,
            duration: 100.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final lottieAnimationController = AnimationController(vsync: this);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFAppState().soundName,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Sora',
                      letterSpacing: 0.0,
                    ),
              ),
              Flexible(
                child: Builder(
                  builder: (context) {
                    if (currentUserUid != '') {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.person_off_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    'AuthPage', context.mounted);
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.person_add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('AuthPage');
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/Animation_-_1725402420353.json',
                        width: 500.0,
                        height: 500.0,
                        fit: BoxFit.contain,
                        controller: lottieAnimationController,
                        onLoaded: (composition) => lottieAnimationController
                            .duration = composition.duration,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Future.wait([
                            Future(() async {
                              if (animationsMap[
                                      'imageOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap['imageOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                            }),
                            Future(() async {
                              unawaited(
                                () async {
                                  await lottieAnimationController.forward();
                                  lottieAnimationController.reset();
                                }(),
                              );
                            }),
                          ]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9999.0),
                          child: Image.network(
                            'https://picsum.photos/seed/300/300',
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['imageOnActionTriggerAnimation']!,
                      ),
                    ],
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
