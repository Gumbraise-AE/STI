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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      if (!FFAppState().sound.hasId()) {
        _model.defaultSound = await SoundsTable().queryRows(
          queryFn: (q) => q.order('created_at', ascending: true),
        );
        FFAppState().updateSoundStruct(
          (e) => e
            ..id = _model.defaultSound?.first.id
            ..createdAt = _model.defaultSound?.first.createdAt
            ..name = _model.defaultSound?.first.name,
        );
        safeSetState(() {});
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
                FFAppState().sound.name,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Sora',
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      context.pushNamed('Scoreboard');
                    },
                  ),
                  Builder(
                    builder: (context) {
                      if (currentUserUid != '') {
                        return FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 9999,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.person_off_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('HomePage', context.mounted);
                          },
                        );
                      } else {
                        return FlutterFlowIconButton(
                          borderRadius: 9999,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.person_add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30,
                          ),
                          onPressed: () async {
                            context.pushNamed('AuthPage');
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Stack(
                    alignment: const AlignmentDirectional(0, 0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Animation_-_1725402420353.json',
                          width: 500,
                          height: 500,
                          fit: BoxFit.contain,
                          controller: lottieAnimationController,
                          onLoaded: (composition) => lottieAnimationController
                              .duration = composition.duration,
                        ),
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
                              unawaited(
                                () async {
                                  await lottieAnimationController.forward();
                                  lottieAnimationController.reset();
                                }(),
                              );
                            }),
                            Future(() async {
                              if (currentUserUid != '') {
                                if (_model.clickNumber == 1) {
                                  unawaited(
                                    () async {
                                      await ClicksTable().insert({
                                        'user_id': currentUserUid,
                                        'sound_id': '',
                                        'click_number': _model.clickNumber,
                                      });
                                    }(),
                                  );
                                } else {
                                  unawaited(
                                    () async {
                                      await ClicksTable().update(
                                        data: {
                                          'user_id': currentUserUid,
                                          'sound_id': '',
                                          'click_number': _model.clickNumber,
                                        },
                                        matchingRows: (rows) => rows,
                                      );
                                    }(),
                                  );
                                }
                              }
                              _model.clickNumber = _model.clickNumber + 1;
                              safeSetState(() {});
                            }),
                          ]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9999),
                          child: Image.network(
                            'https://picsum.photos/seed/300/300',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['imageOnActionTriggerAnimation']!,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Text(
                      valueOrDefault<String>(
                        _model.clickNumber.toString(),
                        '0',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Sora',
                                letterSpacing: 0.0,
                              ),
                    ),
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
