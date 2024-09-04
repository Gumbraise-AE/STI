import '/components/scoreboard/scoreboard_group/scoreboard_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scoreboard_widget.dart' show ScoreboardWidget;
import 'package:flutter/material.dart';

class ScoreboardModel extends FlutterFlowModel<ScoreboardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ScoreboardGroup component.
  late ScoreboardGroupModel scoreboardGroupModel1;
  // Model for ScoreboardGroup component.
  late ScoreboardGroupModel scoreboardGroupModel2;

  @override
  void initState(BuildContext context) {
    scoreboardGroupModel1 = createModel(context, () => ScoreboardGroupModel());
    scoreboardGroupModel2 = createModel(context, () => ScoreboardGroupModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    scoreboardGroupModel1.dispose();
    scoreboardGroupModel2.dispose();
  }
}
