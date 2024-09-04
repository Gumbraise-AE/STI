import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'scoreboard_row_model.dart';
export 'scoreboard_row_model.dart';

class ScoreboardRowWidget extends StatefulWidget {
  const ScoreboardRowWidget({
    super.key,
    required this.clickRow,
  });

  final ClicksRow? clickRow;

  @override
  State<ScoreboardRowWidget> createState() => _ScoreboardRowWidgetState();
}

class _ScoreboardRowWidgetState extends State<ScoreboardRowWidget> {
  late ScoreboardRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScoreboardRowModel());
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              valueOrDefault<String>(
                widget.clickRow?.clickNumber.toString(),
                'Timon',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              '${valueOrDefault<String>(
                widget.clickRow?.clickNumber.toString(),
                '0',
              )} clicks',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
