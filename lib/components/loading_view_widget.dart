import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_view_model.dart';
export 'loading_view_model.dart';

class LoadingViewWidget extends StatefulWidget {
  const LoadingViewWidget({
    super.key,
    bool? parameter1,
  }) : this.parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<LoadingViewWidget> createState() => _LoadingViewWidgetState();
}

class _LoadingViewWidgetState extends State<LoadingViewWidget> {
  late LoadingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: widget.parameter1,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Lottie.asset(
          'assets/lottie_animations/Animation_-_1706758786278.json',
          width: 150.0,
          height: 130.0,
          fit: BoxFit.cover,
          animate: true,
        ),
      ),
    );
  }
}
