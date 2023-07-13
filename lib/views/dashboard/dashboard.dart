import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vbacrypto_signal/core/constants/assets.dart';
import 'package:vbacrypto_signal/core/utils/colors.dart';
import 'package:vbacrypto_signal/core/utils/text.dart';
import 'package:vbacrypto_signal/models/coin_stats_model.dart';

import 'component/bots_card.dart';
import 'component/coin_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

List<CurrentStats> currencyStats = [
  CurrentStats(
    svg: SvgAssets.bitcoin,
    percentage: "36.77 %",
    currencyPair: "BTCUSDT",
    color: const Color(0xff4D5C6A),
  ),
  CurrentStats(
    svg: SvgAssets.etherum,
    percentage: "24.77 %",
    currencyPair: "ETHUSDT",
    color: null,
  ),
  CurrentStats(
    svg: SvgAssets.bnbIcon,
    percentage: "36.07 %",
    currencyPair: "BNBUSDT",
    color: const Color(0xffF3BA2F).withOpacity(.2),
  )
];
List<String> tabs = ["Signal Groups", "Bots"];
int selectedIndex = 1;
ScrollController horizontalController = ScrollController();

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(ImageAssets.profileImage),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.heading("Hey, Jacobs"),
                          AppText.subHeading(
                            "Welcome back",
                            color: AppColors.hintTextColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset(SvgAssets.notification)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    //height: 169,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 15.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: AppColors.secondaryColor,
                      image: const DecorationImage(
                          image: AssetImage(ImageAssets.backgroundImage),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.body("Wallet"),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(14, 9, 10, 9),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.textColor, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            SvgAssets.binanceActive),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        AppText.body(
                                          "Binance",
                                          color: AppColors.textColor,
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.textColor,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          AppText.body("Account Balance"),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText.amountText("\$ 12 480.00"),
                        ]),
                  ),
                  const SizedBox(
                    height: 9.8,
                  ),
                  RawScrollbar(
                    controller: horizontalController,
                    trackColor: const Color(0xff213345),
                    thumbColor: AppColors.textColor,
                    thumbVisibility: true,
                    trackVisibility: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    thickness: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: horizontalController,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 14),
                        child: Row(children: [
                          ...List.generate(
                            currencyStats.length,
                            (index) => CoinCard(
                              currentStats: currencyStats[index],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        2,
                        (index) => GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: selectedIndex == index
                              ? Container(
                                  // margin:
                                  //     EdgeInsets.symmetric(horizontal: 15),
                                  width: index == 1 ? 130 : null,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: AppColors.secondaryColor),
                                  child:
                                      Center(child: AppText.body2(tabs[index])),
                                )
                              : Container(
                                  // margin:
                                  //     EdgeInsets.symmetric(horizontal: 15),
                                  width: index == 1 ? 130 : null,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child:
                                      Center(child: AppText.body2(tabs[index])),
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  selectedIndex == 1
                      ? Column(
                          children: [
                            ...List.generate(3, (index) {
                              bool isActive = index.isEven;
                              return BotsCard(isActive: isActive);
                            })
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 130,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


