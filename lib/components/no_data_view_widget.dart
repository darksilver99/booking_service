import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_data_view_model.dart';
export 'no_data_view_model.dart';

class NoDataViewWidget extends StatefulWidget {
  const NoDataViewWidget({super.key});

  @override
  State<NoDataViewWidget> createState() => _NoDataViewWidgetState();
}

class _NoDataViewWidgetState extends State<NoDataViewWidget> {
  late NoDataViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Icon(
                Icons.error_rounded,
                color: FlutterFlowTheme.of(context).accent3,
                size: 56.0,
              ),
            ),
            Text(
              'ไม่มีข้อมูล',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).accent3,
                    fontSize: 26.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
