library new_web_image;

import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

class NewWebImage extends StatelessWidget {
  final String imageUrl;
  final Function()? onTap;
  final double? allBorderRadius;
  final double? borderTopLeftRadius;
  final double? borderTopRightRadius;
  final double? borderBottomLeftRadius;
  final double? borderBottomRightRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const NewWebImage({
    Key? key,
    required this.imageUrl,
    this.onTap,
    this.allBorderRadius,
    this.borderTopLeftRadius,
    this.borderTopRightRadius,
    this.borderBottomLeftRadius,
    this.borderBottomRightRadius,
    this.width = 1.0,
    this.height = 0.5,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int viewId) => ImageElement()

        ///----Image Url----///
        ..src = imageUrl

        ///----Width && Height----///
        ..style.width = '100%'
        ..style.height = '100%'

        ///----Border Radius----///
        ..style.borderRadius = '$allBorderRadius%'
        ..style.borderTopLeftRadius = '$borderTopLeftRadius%'
        ..style.borderTopRightRadius = '$borderTopRightRadius%'
        ..style.borderBottomLeftRadius = '$borderBottomLeftRadius%'
        ..style.borderBottomRightRadius = '$borderBottomRightRadius%',
    );

    ///----Main Widget----///
    return (imageUrl.isEmpty)
        ? const Text('URL is Empty')
        : Container(
            padding: padding,
            width: MediaQuery.of(context).size.width * width!,
            height: MediaQuery.of(context).size.height * height!,
            child: Stack(
              children: [
                HtmlElementView(
                  viewType: imageUrl,
                ),
                InkWell(onTap: onTap, child: const SizedBox.expand())
              ],
            ),
          );
  }
}
