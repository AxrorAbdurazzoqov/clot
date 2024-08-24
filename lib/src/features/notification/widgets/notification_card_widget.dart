import 'package:clot/src/core/constants/color/color_const.dart';
import 'package:clot/src/core/constants/vectors/app_vectors.dart';
import 'package:clot/src/core/model/notification_model.dart';
import 'package:clot/src/config/theme/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final List<NotificationModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.grey, ColorConst.darkBg),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                AppVectors.instance.notification,
                colorFilter: ColorFilter.mode(checkCurrentModeAndGetColor(MediaQuery.of(context).platformBrightness, ColorConst.black, ColorConst.white), BlendMode.srcIn),
              ),
              Visibility(
                visible: !data[index].isRead,
                child: Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: ColorConst.red,
                    radius: 5,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 21),
          Expanded(
            child: Text(
              data[index].notificationText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
