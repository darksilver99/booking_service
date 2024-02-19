import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_q_r_code_dialog_view_model.dart';
export 'payment_q_r_code_dialog_view_model.dart';

class PaymentQRCodeDialogViewWidget extends StatefulWidget {
  const PaymentQRCodeDialogViewWidget({super.key});

  @override
  State<PaymentQRCodeDialogViewWidget> createState() =>
      _PaymentQRCodeDialogViewWidgetState();
}

class _PaymentQRCodeDialogViewWidgetState
    extends State<PaymentQRCodeDialogViewWidget> {
  late PaymentQRCodeDialogViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentQRCodeDialogViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var paymentHistoryListRecordReference =
          PaymentHistoryListRecord.collection.doc();
      await paymentHistoryListRecordReference
          .set(createPaymentHistoryListRecordData(
        createDate: getCurrentTimestamp,
        createBy: currentUserReference,
        status: 0,
        amount: FFAppState().price,
        paymentType: 'qrCode',
      ));
      _model.tmpPaymentRef = PaymentHistoryListRecord.getDocumentFromData(
          createPaymentHistoryListRecordData(
            createDate: getCurrentTimestamp,
            createBy: currentUserReference,
            status: 0,
            amount: FFAppState().price,
            paymentType: 'qrCode',
          ),
          paymentHistoryListRecordReference);
      setState(() {
        _model.paymentRef = _model.tmpPaymentRef?.reference;
      });
      _model.rsURL = await actions.setQRCodePayment(
        _model.tmpPaymentRef?.reference,
      );
      setState(() {
        _model.url = _model.rsURL;
      });
    });
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
        width: MediaQuery.sizeOf(context).width * 0.95,
        height: MediaQuery.sizeOf(context).height * 0.95,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            if (_model.url != null && _model.url != '')
              Expanded(
                child: FlutterFlowWebView(
                  content: _model.url!,
                  bypass: false,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ),
            if (_model.paymentRef != null)
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 6.0, 16.0),
                      child: StreamBuilder<PaymentHistoryListRecord>(
                        stream: PaymentHistoryListRecord.getDocument(
                            _model.paymentRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final buttonPaymentHistoryListRecord = snapshot.data!;
                          return FFButtonWidget(
                            onPressed: () async {
                              if (buttonPaymentHistoryListRecord.status == 1) {
                                Navigator.pop(context);
                              }
                            },
                            text: () {
                              if (buttonPaymentHistoryListRecord.status == 0) {
                                return 'Processing...';
                              } else if (buttonPaymentHistoryListRecord
                                      .status ==
                                  1) {
                                return 'Successfully';
                              } else {
                                return 'Failed';
                              }
                            }(),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: () {
                                if (buttonPaymentHistoryListRecord.status ==
                                    0) {
                                  return FlutterFlowTheme.of(context).warning;
                                } else if (buttonPaymentHistoryListRecord
                                        .status ==
                                    1) {
                                  return FlutterFlowTheme.of(context).success;
                                } else {
                                  return FlutterFlowTheme.of(context).error;
                                }
                              }(),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
