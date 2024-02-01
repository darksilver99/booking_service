import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'information_dialog_view_model.dart';
export 'information_dialog_view_model.dart';

class InformationDialogViewWidget extends StatefulWidget {
  const InformationDialogViewWidget({
    super.key,
    required this.title,
    this.detail,
    String? status,
  }) : status = status ?? 'success';

  final String? title;
  final String? detail;
  final String status;

  @override
  State<InformationDialogViewWidget> createState() =>
      _InformationDialogViewWidgetState();
}

class _InformationDialogViewWidgetState
    extends State<InformationDialogViewWidget> {
  late InformationDialogViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationDialogViewModel());
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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.status == 'warning')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Icon(
                    Icons.error_rounded,
                    color: FlutterFlowTheme.of(context).warning,
                    size: 56.0,
                  ),
                ),
              if (widget.status == 'success')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: FlutterFlowTheme.of(context).success,
                    size: 56.0,
                  ),
                ),
              if (widget.status == 'error')
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Icon(
                    Icons.cancel_rounded,
                    color: FlutterFlowTheme.of(context).error,
                    size: 56.0,
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.title,
                    '-',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (widget.detail != null && widget.detail != '')
                Text(
                  valueOrDefault<String>(
                    widget.detail,
                    '-',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                      ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context, true);
                      },
                      text: 'ตกลง',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
