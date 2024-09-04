import '/backend/supabase/supabase.dart';
import '/components/scoreboard/scoreboard_row/scoreboard_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'scoreboard_group_model.dart';
export 'scoreboard_group_model.dart';

class ScoreboardGroupWidget extends StatefulWidget {
  const ScoreboardGroupWidget({
    super.key,
    required this.clickRows,
  });

  final List<ClicksRow>? clickRows;

  @override
  State<ScoreboardGroupWidget> createState() => _ScoreboardGroupWidgetState();
}

class _ScoreboardGroupWidgetState extends State<ScoreboardGroupWidget> {
  late ScoreboardGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScoreboardGroupModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Builder(
                builder: (context) {
                  final rows = widget.clickRows!.toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(rows.length, (rowsIndex) {
                      final rowsItem = rows[rowsIndex];
                      return ScoreboardRowWidget(
                        key: Key('Keyd9f_${rowsIndex}_of_${rows.length}'),
                        clickRow: rowsItem,
                      );
                    })
                        .divide(const SizedBox(height: 16))
                        .around(const SizedBox(height: 16)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
