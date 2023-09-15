import 'package:flutter/material.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCpn extends StatelessWidget {
  const ShimmerCpn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppWidget.getWidthScreen(context) / 3.2,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color4.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: grey100,
                highlightColor: isabelline,
                child: Container(
                  width: 145,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isabelline),
                ),
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: grey100,
                highlightColor: isabelline,
                child: Container(
                  width: 145,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isabelline),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Shimmer.fromColors(
                baseColor: grey100,
                highlightColor: isabelline,
                child: Container(
                  width: 145,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isabelline),
                ),
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: grey100,
                  highlightColor: isabelline,
                  child: Container(
                    width: 145,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isabelline),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: grey100,
                    highlightColor: isabelline,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isabelline),
                    ),
                  ),
                  // SizedBox(width: AppWidget.getWidthScreen(context) / 7.0),
                  // Shimmer.fromColors(
                  //   baseColor: grey100,
                  //   highlightColor: isabelline,
                  //   child: Container(
                  //     width: 145,
                  //     height: 12,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: isabelline),
                  //   ),
                  // ),
                ],
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: grey100,
                highlightColor: isabelline,
                child: Container(
                  width: 145,
                  height: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isabelline),
                ),
              ),
            ],
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Shimmer.fromColors(
          //       baseColor: grey100,
          //       highlightColor: isabelline,
          //       child: Container(
          //         width: 80,
          //         height: 80,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: isabelline),
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(bottom: 4),
          //             child: Shimmer.fromColors(
          //               baseColor: grey100,
          //               highlightColor: isabelline,
          //               child: Container(
          //                 width: 225,
          //                 height: 20,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(4),
          //                     color: isabelline),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(bottom: 4),
          //             child: Shimmer.fromColors(
          //               baseColor: grey100,
          //               highlightColor: isabelline,
          //               child: Container(
          //                 width: 145,
          //                 height: 12,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(4),
          //                     color: isabelline),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(bottom: 4),
          //             child: Shimmer.fromColors(
          //               baseColor: grey100,
          //               highlightColor: isabelline,
          //               child: Container(
          //                 width: 225,
          //                 height: 20,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(4),
          //                     color: isabelline),
          //               ),
          //             ),
          //           ),
          //           Shimmer.fromColors(
          //             baseColor: grey100,
          //             highlightColor: isabelline,
          //             child: Container(
          //               width: 145,
          //               height: 12,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(4),
          //                   color: isabelline),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Shimmer.fromColors(
          //       baseColor: grey100,
          //       highlightColor: isabelline,
          //       child: Container(
          //         width: 16,
          //         height: 16,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(4),
          //             color: isabelline),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ShimmerActivityCpn extends StatelessWidget {
  const ShimmerActivityCpn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppWidget.getWidthScreen(context) / 3.5,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color4.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: grey100,
            highlightColor: isabelline,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: isabelline),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Shimmer.fromColors(
                    baseColor: grey100,
                    highlightColor: isabelline,
                    child: Container(
                      width: 225,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isabelline),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: grey100,
                  highlightColor: isabelline,
                  child: Container(
                    width: 145,
                    height: 12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isabelline),
                  ),
                ),
              ],
            ),
          ),
          Shimmer.fromColors(
            baseColor: grey100,
            highlightColor: isabelline,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: isabelline),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerUploadImageCpn extends StatelessWidget {
  const ShimmerUploadImageCpn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppWidget.getWidthScreen(context) / 3.5,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color4.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: grey100,
            highlightColor: isabelline,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: isabelline),
            ),
          ),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 4),
          //         child: Shimmer.fromColors(
          //           baseColor: grey100,
          //           highlightColor: isabelline,
          //           child: Container(
          //             width: 225,
          //             height: 20,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(4),
          //                 color: isabelline),
          //           ),
          //         ),
          //       ),
          //       Shimmer.fromColors(
          //         baseColor: grey100,
          //         highlightColor: isabelline,
          //         child: Container(
          //           width: 145,
          //           height: 12,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(4),
          //               color: isabelline),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Shimmer.fromColors(
          //   baseColor: grey100,
          //   highlightColor: isabelline,
          //   child: Container(
          //     width: 16,
          //     height: 16,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4), color: isabelline),
          //   ),
          // ),
        ],
      ),
    );
  }
}
