import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'scoreboard_row_widget.dart' show ScoreboardRowWidget;
import 'package:flutter/material.dart';

class ScoreboardRowModel extends FlutterFlowModel<ScoreboardRowWidget> {
  /// Query cache managers for this widget.

  final _queryNameManager = FutureRequestManager<List<UserProfilesRow>>();
  Future<List<UserProfilesRow>> queryName({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserProfilesRow>> Function() requestFn,
  }) =>
      _queryNameManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQueryNameCache() => _queryNameManager.clear();
  void clearQueryNameCacheKey(String? uniqueKey) =>
      _queryNameManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearQueryNameCache();
  }
}
