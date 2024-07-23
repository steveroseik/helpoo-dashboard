import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/cubit/cubit.dart';
import '../../../core/util/cubit/state.dart';
import '../../../core/util/extensions/days_extensions.dart';
import '../../../core/util/widgets/show_pop_up.dart';
import '../widgets/my_rich_text.dart';

class SupplementImages extends StatelessWidget {
  const SupplementImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyRichText(
            text: 'Name: ',
            text2: appBloc.accidentDetailsModel?.report?.supplementLocation?[0]
                    .name ??
                '',
          ),
          space15Vertical(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Supplement Location: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  launchMap(
                    latitude: appBloc.accidentDetailsModel?.report
                            ?.supplementLocation?[0].lat ??
                        0,
                    longitude: appBloc.accidentDetailsModel?.report
                            ?.supplementLocation?[0].lng ??
                        0,
                  );
                },
                child: Text(
                  appBloc.accidentDetailsModel?.report?.supplementLocation?[0]
                          .address ??
                      ''.toLowerCase(),
                  style: const TextStyle(
                    color: Colors.transparent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(color: Colors.blueAccent, offset: Offset(0, -3))
                    ],
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blueAccent,
                    decorationThickness: 3,
                  ),
                ),
              ),
            ],
          ),
          space30Vertical(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: List.generate(
              appBloc.accidentDetailsModel?.supplementImages?.length ?? 0,
              (index) {
                return InkWell(
                  onTap: () {
                    showImageSliderPopUp(
                      context: context,
                      index: index,
                      images: appBloc.accidentDetailsModel?.supplementImages
                              ?.map((e) => e.imagePath ?? '')
                              .toList() ??
                          [],
                    );
                  },
                  child: SizedBox(
                    width: 250,
                    height: 400,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 400,
                          child: MyNetworkImage(
                            imageUrl: appBloc.accidentDetailsModel
                                    ?.supplementImages?[index].imagePath ??
                                '',
                          ),
                        ),
                        // Container(
                        //   height: 30,
                        //   width: double.infinity,
                        //   color: Colors.black.withOpacity(0.5),
                        //   child: Center(
                        //     child: Text(
                        //       appBloc.accidentDetailsModel
                        //               ?.supplementImages?[index].imageName ??
                        //           '',
                        //       style: const TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: 30,
                          width: 380,
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  appBloc
                                          .accidentDetailsModel
                                          ?.supplementImages?[index]
                                          .imageName ??
                                      '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              space10Horizontal(),
                              Text(
                                DateTime.parse(appBloc
                                                .accidentDetailsModel
                                                ?.supplementImages?[index]
                                                .createdAt ??
                                            '')
                                        .utcToLocalFormat ??
                                    '',
                                // DateTime.parse(appBloc
                                //                 .accidentDetailsModel
                                //                 ?.supplementImages?[index]
                                //                 .createdAt ??
                                //             '')
                                //         .timedayMonthYearFormat ??
                                //     '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          space30Vertical(),
        ],
      );
    });
  }
}