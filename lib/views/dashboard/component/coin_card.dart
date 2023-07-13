import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text.dart';
import '../../../models/coin_stats_model.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.currentStats,
  });

  const CoinCard.withBackground({
    super.key,
    required this.currentStats,
  });
  final CurrentStats currentStats;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.fromLTRB(12, 12, 22, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        currentStats.color == null
            ? SvgPicture.asset(currentStats.svg)
            : Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: currentStats.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(currentStats.svg),
              ),
        const SizedBox(height: 21),
        AppText.body(currentStats.currencyPair),
        AppText.body3(currentStats.percentage),
      ]),
    );
  }
}
