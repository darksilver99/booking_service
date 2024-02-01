import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'rating_view_model.dart';
export 'rating_view_model.dart';

class RatingViewWidget extends StatefulWidget {
  const RatingViewWidget({
    super.key,
    this.parameter1,
  });

  final double? parameter1;

  @override
  State<RatingViewWidget> createState() => _RatingViewWidgetState();
}

class _RatingViewWidgetState extends State<RatingViewWidget> {
  late RatingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).warning,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= valueOrDefault<double>(
        widget.parameter1,
        0.0,
      ),
      unratedColor: FlutterFlowTheme.of(context).accent3,
      itemCount: 5,
      itemSize: 20.0,
      glowColor: FlutterFlowTheme.of(context).warning,
    );
  }
}
