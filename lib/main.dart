import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logmei_flutter_demo/MainPage.dart';
import 'package:logmei_flutter_demo/Login.dart';


/// Causes each RenderBox to paint a box around its bounds, and some extra
/// boxes, such as [RenderPadding], to draw construction lines.
///
/// The edges of the boxes are painted as a one-pixel-thick `const Color(0xFF00FFFF)` outline.
///
/// Spacing is painted as a solid `const Color(0x90909090)` area.
///
/// Padding is filled in solid `const Color(0x900090FF)`, with the inner edge
/// outlined in `const Color(0xFF0090FF)`, using [debugPaintPadding].
bool debugPaintSizeEnabled = false;

/// Causes each RenderBox to paint a line at each of its baselines.
bool debugPaintBaselinesEnabled = false;

/// Causes each Layer to paint a box around its bounds.
bool debugPaintLayerBordersEnabled = false;

/// Causes objects like [RenderPointerListener] to flash while they are being
/// tapped. This can be useful to see how large the hit box is, e.g. when
/// debugging buttons that are harder to hit than expected.
///
/// For details on how to support this in your [RenderBox] subclass, see
/// [RenderBox.debugHandleEvent].
bool debugPaintPointersEnabled = false;

/// Overlay a rotating set of colors when repainting layers in checked mode.
///
/// See also:
///
///  * [RepaintBoundary], which can be used to contain repaints when unchanged
///    areas are being excessively repainted.
bool debugRepaintRainbowEnabled = false;

/// Overlay a rotating set of colors when repainting text in checked mode.
bool debugRepaintTextRainbowEnabled = false;
void main(){
  
  debugPaintSizeEnabled = true;
  debugPaintPointersEnabled = true;
  runApp(new MyApp());
  }

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context){
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Color.fromRGBO(35,194,183,1),
          primarySwatch: Colors.green
        ),
        home: Login(),
      );
    }
}