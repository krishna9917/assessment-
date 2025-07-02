import 'package:assesment/utils/utilities_functions/util_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../config/resources/colors/app_colors.dart';
import '../../config/resources/constant/assets.dart';

class ApiImage extends StatelessWidget {
  const ApiImage({
    super.key,
    this.uri = "",
    this.height,
    this.width,
    this.fit,
    this.tempImage = AppAssets.logo,
    this.borderRadius,
    this.circularRadius,
    this.tempPadding
  });

  final String tempImage;
  final String uri;
  final double? height;
  final double? width;
  final double? tempPadding;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final double? circularRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        uri == "undefined" || uri == "null" || uri == ""
            ? SizedBox(
                height: height,
                width: width,
                child: Padding(
                  padding: EdgeInsets.all(tempPadding ?? 0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius:
                          borderRadius ??
                          BorderRadius.circular(circularRadius ?? 0),
                    ),
                    child: Image.asset(
                      tempImage,
                      height: height,
                      width: width,
                      fit: fit,
                    ),
                  ),
                ),
              )
            : CachedNetworkImage(
                httpHeaders: const {"Access-Control-Allow-Origin": "*"},
                imageUrl: uri,
                height: height,
                width: width,
                fit: fit,
                placeholder: (context, url) {
                  return UtilFunctions.shimmer(
                    enabled: true,
                    child: Container(
                      color: AppColors.primaryShade900,
                      height: height,
                      width: width,
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                ),
                errorWidget: (context, url, error) {
                  return Padding(
                    padding: EdgeInsets.all(tempPadding ?? 0),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            borderRadius ??
                            BorderRadius.circular(circularRadius ?? 0),
                      ),
                      child: Image.asset(
                        tempImage,
                        height: height,
                        width: width,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
