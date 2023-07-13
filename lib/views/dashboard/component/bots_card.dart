import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text.dart';

class BotsCard extends StatelessWidget {
  const BotsCard({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.body2(
                "EMA Cross 50  200 + ADX \n (Long)",
                //color: AppColors.textColor,
              ),
              const SizedBox(
                height: 10,
              ),
              AppText.body2(
                "Distribution Bot",
                fontSize: 12,
                color: AppColors.hintTextColor,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isActive
                    ? AppColors.activeBackgroundColor.withOpacity(.1)
                    : AppColors.hintTextColor.withOpacity(.1)),
            child: Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? AppColors.activeColor
                          : AppColors.hintTextColor),
                ),
                const SizedBox(
                  width: 8,
                ),
                AppText.body2(
                  isActive ? "Active" : "Inactive",
                  fontSize: 12,
                  color: isActive
                      ? AppColors.activeColor
                      : AppColors.hintTextColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
