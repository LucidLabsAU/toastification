import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// default style for info toastification
const infoColor = Color(0xFF47AFFF);

/// default color for success toastification
const successColor = Color(0xFF32BC32);

/// default color for warning toastification
const warningColor = Color(0xFFFFB600);

/// default color for error toastification
const errorColor = Color(0xFFFF3A30);

const lowModeShadow = [
  BoxShadow(
    color: Color(0x07000000),
    blurRadius: 16,
    offset: Offset(0, 16),
    spreadRadius: 0,
  )
];

const highModeShadow = [
  BoxShadow(
    color: Color(0x14000000),
    blurRadius: 30,
    offset: Offset(0, 20),
    spreadRadius: 0,
  )
];

/// Base abstract class for built-in styles
abstract class BuiltInStyle {
  const BuiltInStyle(this.type);

  factory BuiltInStyle.fromToastificationStyle(
    ToastificationStyle style,
    ToastificationType type,
  ) {
    return switch (style) {
      ToastificationStyle.minimal => MinimalStyle(type),
      ToastificationStyle.fillColored => FilledStyle(type),
      ToastificationStyle.flatColored => FlatColoredStyle(type),
      ToastificationStyle.flat => FlatStyle(type),
      ToastificationStyle.simple => SimpleStyle(type),
    };
  }

  final ToastificationType type;

  EdgeInsetsGeometry padding(BuildContext context) =>
      const EdgeInsetsDirectional.fromSTEB(20, 16, 12, 16);

  MaterialColor primaryColor(BuildContext context);
  MaterialColor onPrimaryColor(BuildContext context);
  Color backgroundColor(BuildContext context);
  Color foregroundColor(BuildContext context);

  String icon(BuildContext context) {
    return switch (type) {
      ToastificationType.success =>
        '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12 22C17.5 22 22 17.5 22 12C22 6.5 17.5 2 12 2C6.5 2 2 6.5 2 12C2 17.5 6.5 22 12 22Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M7.75 12L10.58 14.83L16.25 9.17004" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''',
      ToastificationType.info =>
        '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12 22C17.5 22 22 17.5 22 12C22 6.5 17.5 2 12 2C6.5 2 2 6.5 2 12C2 17.5 6.5 22 12 22Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M12 8V13" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M11.9945 16H12.0035" stroke="#292D32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''',
      ToastificationType.warning =>
        '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12 9V14" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M12.0001 21.41H5.94005C2.47005 21.41 1.02005 18.93 2.70005 15.9L5.82006 10.28L8.76006 5.00003C10.5401 1.79003 13.4601 1.79003 15.2401 5.00003L18.1801 10.29L21.3001 15.91C22.9801 18.94 21.5201 21.42 18.0601 21.42H12.0001V21.41Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M11.9945 17H12.0035" stroke="#292D32" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''',
      ToastificationType.error =>
        '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12 22C17.5 22 22 17.5 22 12C22 6.5 17.5 2 12 2C6.5 2 2 6.5 2 12C2 17.5 6.5 22 12 22Z" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9.16998 14.83L14.83 9.17004" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M14.83 14.83L9.16998 9.17004" stroke="#292D32" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''',
    };
  }

  Color iconColor(BuildContext context);

  IconData closeIcon(BuildContext context);
  Color closeIconColor(BuildContext context);

  BorderSide borderSide(BuildContext context);

  BorderRadiusGeometry borderRadius(BuildContext context);

  TextStyle? titleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            color: foregroundColor(context),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.2,
          );

  TextStyle? descriptionTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(
            color: foregroundColor(context).withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w300,
            height: 1.2,
          );

  double elevation(BuildContext context) => 0.0;
  List<BoxShadow> boxShadow(BuildContext context) => const [];

  double progressIndicatorStrokeWidth(BuildContext context) => 2.0;

  ProgressIndicatorThemeData progressIndicatorTheme(BuildContext context);
}
