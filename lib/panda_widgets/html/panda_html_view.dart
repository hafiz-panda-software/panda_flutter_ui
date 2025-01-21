import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PandaHtmlView extends StatelessWidget {
  final String data;
  final Color? textColor;
  final double? fontSize;
  final FontWeight fontWeight;
  final bool isCenterText;
  final Function(String? url)? onLinkTap;

  const PandaHtmlView({
    Key? key,
    required this.data,
    this.textColor,
    this.fontSize,
    this.isCenterText = false,
    this.fontWeight = FontWeight.normal,
    this.onLinkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PandaTextFormatService _textFormatService = PandaTextFormatService();
    // return Container();
    return HtmlWidget(
      '''
      <p>
      ${_textFormatService.fixEmoji(
        _textFormatService.cleanAmpersand(
          _textFormatService.sanitizeHtml(data),
        ),
      )}
      </p>
      ''',
      renderMode: RenderMode.column,
      customStylesBuilder: (element) {
        Map<String, String> styles = {};
        if (isCenterText) {
          styles.addEntries({'text-align': 'center'}.entries);
        }
        if (element.localName == 'th') {
          styles.addEntries({
            'text-align': 'center',
            'vertical-align': 'center',
            //'align-items': 'center',
            'border': '1px solid black',
            'height': '100px',
          }.entries);
        }
        if (element.localName == 'td') {
          styles.addEntries({
            'text-align': 'start',
            //'vertical-align': 'center',
            //'horizontal-align': 'center',
            'border': '1px solid black',
            'height': '100px',
          }.entries);
        }
        return styles;
      },

      textStyle: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      onTapUrl: (url) {
        if (onLinkTap != null) {
          onLinkTap!(url);
          return true;
        } else {
          return false;
        }
      },
      // style: {
      //   "*": Style(
      //     textAlign: textAlign,
      //     margin: Margins.zero,
      //   ),
      //   "h1": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(30),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h2": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(25),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h3": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(22),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h4": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(20),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h5": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(18),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h6": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(15),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "p": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(fontSize ?? 15),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: fontWeight,
      //   ),
      //   "a": Style(
      //     margin: Margins.all(0),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(fontSize ?? 15),
      //     color: accentColor,
      //     textAlign: textAlign,
      //     fontWeight: fontWeight,
      //   ),
      //   "table": Style(
      //       // backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
      //       ),
      //   // some other granular customizations are also possible
      //   "tr": Style(
      //     border: Border(
      //       bottom: BorderSide(
      //         color: borderColor ?? Colors.grey,
      //       ),
      //     ),
      //   ),
      //   "th": Style(
      //     padding: HtmlPaddings.all(10),
      //     backgroundColor: Colors.grey,
      //   ),
      //   "td": Style(
      //     padding: HtmlPaddings.all(10),
      //     alignment: Alignment.topLeft,
      //   ),
      //   "body": isRemoveBodyPadding
      //       ? Style(
      //           // margin: EdgeInsets.zero,
      //           margin: Margins.zero,
      //           // padding: EdgeInsets.zero,
      //           padding: HtmlPaddings.zero,
      //         )
      //       : Style()
      // },
    );
  }
}
