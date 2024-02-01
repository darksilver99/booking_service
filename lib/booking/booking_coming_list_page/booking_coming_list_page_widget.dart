import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'booking_coming_list_page_model.dart';
export 'booking_coming_list_page_model.dart';

class BookingComingListPageWidget extends StatefulWidget {
  const BookingComingListPageWidget({super.key});

  @override
  State<BookingComingListPageWidget> createState() =>
      _BookingComingListPageWidgetState();
}

class _BookingComingListPageWidgetState
    extends State<BookingComingListPageWidget> {
  late BookingComingListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingComingListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'รายการจองที่เข้ามา',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    BookingListRecord>(
                  pagingController: _model.setListViewController(
                    BookingListRecord.collection
                        .where(
                          'owner_ref',
                          isEqualTo: currentUserReference,
                        )
                        .where(
                          'status',
                          isNotEqualTo: 2,
                        )
                        .orderBy('status')
                        .orderBy('create_date', descending: true),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    16.0,
                  ),
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<BookingListRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (_) => NoDataViewWidget(
                      msg: 'ยังไม่มีรายการจองเข้ามา',
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewBookingListRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Icon(
                                                Icons.circle_rounded,
                                                color: () {
                                                  if (listViewBookingListRecord
                                                          .status ==
                                                      0) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  } else if (listViewBookingListRecord
                                                          .status ==
                                                      1) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (listViewBookingListRecord
                                                          .status ==
                                                      3) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  } else if (listViewBookingListRecord
                                                          .status ==
                                                      4) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  }
                                                }(),
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  ServiceListRecord>(
                                                stream: ServiceListRecord
                                                    .getDocument(
                                                        listViewBookingListRecord
                                                            .serviceRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnServiceListRecord =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          columnServiceListRecord
                                                              .category,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        columnServiceListRecord
                                                            .title,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.getBookingStatus(
                                                    listViewBookingListRecord
                                                        .status),
                                                '-',
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: () {
                                                          if (listViewBookingListRecord
                                                                  .status ==
                                                              0) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .warning;
                                                          } else if (listViewBookingListRecord
                                                                  .status ==
                                                              1) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .success;
                                                          } else if (listViewBookingListRecord
                                                                  .status ==
                                                              3) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .warning;
                                                          } else if (listViewBookingListRecord
                                                                  .status ==
                                                              4) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .error;
                                                          }
                                                        }(),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            functions.getThaiDatetime(
                                                listViewBookingListRecord
                                                    .bookingDate),
                                            '-',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
