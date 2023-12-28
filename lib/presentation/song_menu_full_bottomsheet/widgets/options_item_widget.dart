import '../models/options_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vishwas_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class OptionsItemWidget extends StatelessWidget {
  OptionsItemWidget(
    this.optionsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OptionsItemModel optionsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: optionsItemModelObj?.addtoPlaylist,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 78.h,
              top: 3.v,
              bottom: 2.v,
            ),
            child: Text(
              optionsItemModelObj.addToPlaylist!,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
