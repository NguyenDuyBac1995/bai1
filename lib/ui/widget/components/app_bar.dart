import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';

PreferredSize appBarCommonV1(BuildContext context,
    {String? strTitle, TextEditingController? controller, bool? suffixIcon}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colos.LOGINTEXT1,
                  ),
                ),
                Text(strTitle??'', textAlign: TextAlign.center,style: TextStyles.textAppBar ,),
                suffixIcon == true ? Container(width: 40 ): IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined))
              ],
            )
          ],
        ),
      ));
}
