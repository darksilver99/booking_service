import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'approve_from_view_model.dart';
export 'approve_from_view_model.dart';

class ApproveFromViewWidget extends StatefulWidget {
  const ApproveFromViewWidget({
    super.key,
    required this.bookingRef,
  });

  final DocumentReference? bookingRef;

  @override
  State<ApproveFromViewWidget> createState() => _ApproveFromViewWidgetState();
}

class _ApproveFromViewWidgetState extends State<ApproveFromViewWidget> {
  late ApproveFromViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveFromViewModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintText: 'รายละเอียดถึงผู้จอง',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).accent2,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: const ConfirmDialogViewWidget(
                                  title:
                                      'ระบบจะส่งแจ้งเตือนไปยังผู้จอง ต้องการยืนยันหรือไม่',
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.isConfirm = value));

                          if ((_model.isConfirm != null) && _model.isConfirm!) {
                            await widget.bookingRef!
                                .update(createBookingListRecordData(
                              ownerDetail: _model.textController.text,
                              updateDate: getCurrentTimestamp,
                              updateBy: currentUserReference,
                              status: 1,
                            ));
                            Navigator.pop(context);
                          }

                          setState(() {});
                        },
                        text: 'อนุมัติรายการจอง',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const ConfirmDialogViewWidget(
                                title: 'ต้องการยกเลิกรายการ?',
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.isConfirm2 = value));

                        if ((_model.isConfirm2 != null) && _model.isConfirm2!) {
                          await widget.bookingRef!
                              .update(createBookingListRecordData(
                            updateDate: getCurrentTimestamp,
                            updateBy: currentUserReference,
                            status: 5,
                          ));
                          Navigator.pop(context);
                        }

                        setState(() {});
                      },
                      text: 'ยกเลิกรายการ',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
