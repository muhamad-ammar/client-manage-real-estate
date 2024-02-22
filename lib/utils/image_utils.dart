import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/appTheme.dart';
import 'log_utils.dart';

class ImageUtils {
  const ImageUtils._internal();

  // static Widget getNetworkImage(
  //     String? imageUrl, {
  //       String? placeholder,
  //       double? width,
  //       double? height,
  //       BoxFit? fit,
  //     }) {
  //   // return SizedBox(
  //   //   width: width,
  //   //   height: height,
  //   //   child: Image.network(
  //   //     imageUrl ?? '',
  //   //     fit: BoxFit.fill,
  //   //     loadingBuilder: (BuildContext context, Widget child,
  //   //         ImageChunkEvent? loadingProgress) {
  //   //       if (loadingProgress == null) return child;
  //   //       return Center(
  //   //         child: CircularProgressIndicator(
  //   //           value: loadingProgress.expectedTotalBytes != null
  //   //               ? loadingProgress.cumulativeBytesLoaded /
  //   //               loadingProgress.expectedTotalBytes!
  //   //               : null,
  //   //         ),
  //   //       );
  //   //     },
  //   //   ),
  //   // );
  //   // return CachedNetworkImage(
  //   //   imageUrl: imageUrl ?? '',
  //   //   width: width,
  //   //   height: height,
  //   //   placeholder: (context, url) {
  //   //     return Image.asset(AppAssets.icAppLogoPng);
  //   //   },
  //   //   errorWidget: (context, url, error) {
  //   //     LogUtils.error('Image Exception: [Url=$url -> $error]');
  //   //     return _getErrorWidget(
  //   //       errorImage: placeholder,
  //   //       width: width,
  //   //       height: height,
  //   //       fit: fit,
  //   //     );
  //   //   },
  //   //   fit: fit ?? BoxFit.fill,
  //   // );
  // }

  static Widget getLocalImage(
      String? imagePath, {
        double? width,
        double? height,
        BoxFit? fit,
      }) {
    return Image.asset(
      imagePath ?? '',
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        LogUtils.error(error);
        return _getErrorWidget(
          errorImage: imagePath,
          width: width,
          height: height,
          fit: fit,
        );
      },
      fit: fit ?? BoxFit.fill,
    );
  }

  static Widget getLocalSvgImage(
      String? imagePath, {
        Color? color,
        double? width,
        double? height,
        BoxFit? fit,
      }) {
    if (imagePath?.isNotEmpty == true) {
      return SvgPicture.asset(
        imagePath!,
        color: color,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }
    return _getErrorWidget(
      errorImage: imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }

  static Widget getLocalDeviceImage(
      String? imagePath, {
        double? width,
        double? height,
        BoxFit? fit,
      }) {
    return Image.file(
      File(imagePath!),
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        LogUtils.error(error);
        return _getErrorWidget(
          errorImage: '',
          width: width,
          height: height,
          fit: fit,
        );
      },
      fit: fit ?? BoxFit.fill,
    );
  }

  static Widget _getErrorWidget({
    String? errorImage,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    if (errorImage?.isNotEmpty == true) {
      return Image.asset(
        errorImage!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
      );
    }
    return const Icon(Icons.error, color: AppTheme.errorColor);
  }
}
