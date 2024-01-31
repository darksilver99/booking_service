import 'package:geocoding/geocoding.dart';
import 'package:map_picker/map_picker.dart';

import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_picker_page_model.dart';
export 'map_picker_page_model.dart';

class MapPickerPageWidget extends StatefulWidget {
  const MapPickerPageWidget({super.key});

  @override
  State<MapPickerPageWidget> createState() => _MapPickerPageWidgetState();
}

class _MapPickerPageWidgetState extends State<MapPickerPageWidget> {
  late MapPickerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();
  CameraPosition? cameraPosition;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPickerPageModel());
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              MapPicker(
                // pass icon widget
                iconWidget: Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 48,
                ),
                //add map picker controller
                mapPickerController: mapPickerController,
                child: GoogleMap(
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  // hide location button
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  //  camera position
                  initialCameraPosition: cameraPosition!,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraMoveStarted: () {
                    // notify map is moving
                    mapPickerController.mapMoving!();
                  },
                  onCameraMove: (cameraPosition) {
                    this.cameraPosition = cameraPosition;
                    // currentCenterPosition = LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);
                  },
                  onCameraIdle: () async {
                    // notify map stopped moving
                    mapPickerController.mapFinishedMoving!();
                    //get address name from camera position
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                      cameraPosition!.target.latitude,
                      cameraPosition!.target.longitude,
                    );
                    // currentCenterPosition = LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude);
                    // update the ui with the address
                    /* textController.text =
                    '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';*/
                    print(placemarks.first);
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        FFAppState().currentLocation = LatLng(cameraPosition!.target.latitude, cameraPosition!.target.longitude);
                        context.safePop();
                      },
                      text: 'เลือกพิกัดนี้',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsets.all(0.0),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
