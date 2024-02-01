import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_booking_status_view_model.dart';
export 'update_booking_status_view_model.dart';

class UpdateBookingStatusViewWidget extends StatefulWidget {
  const UpdateBookingStatusViewWidget({
    super.key,
    required this.bookingRef,
  });

  final DocumentReference? bookingRef;

  @override
  State<UpdateBookingStatusViewWidget> createState() =>
      _UpdateBookingStatusViewWidgetState();
}

class _UpdateBookingStatusViewWidgetState
    extends State<UpdateBookingStatusViewWidget> {
  late UpdateBookingStatusViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateBookingStatusViewModel());
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: ConfirmDialogViewWidget(
                                  title:
                                      'ระบบจะส่งแจ้งเตือนไปยังผู้จองเพื่อให้รีวิว',
                                  detail:
                                      'เมื่อผู้จองรีวิวเสร็จสถานะจะเปลี่ยนเป็นเสร็จสิ้น',
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.isConfirm = value));

                          if ((_model.isConfirm != null) && _model.isConfirm!) {
                            await widget.bookingRef!
                                .update(createBookingListRecordData(
                              updateDate: getCurrentTimestamp,
                              updateBy: currentUserReference,
                              status: 3,
                            ));
                            Navigator.pop(context);
                          }

                          setState(() {});
                        },
                        text: 'เปลี่ยนสถาะเป็นรอรีวิว',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
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
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: ConfirmDialogViewWidget(
                                title: 'ต้องการยกเลิกรายการ?',
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.isConfirm = value));

                        if ((_model.isConfirm != null) && _model.isConfirm!) {
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
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
