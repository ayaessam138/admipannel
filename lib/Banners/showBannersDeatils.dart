import 'package:afcooadminpanel/Banners/bannersModel.dart';
import 'package:afcooadminpanel/Banners/banners_cubit.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/tableRowWidght.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBannersDetails extends StatelessWidget {
  final BannersModel BannersbyIdModel;
  List<String> keysList = [
    "id",
    "title",
    "titleEn",
    'url',
    "status",
    "image",
    "ShowinWebSite",
    "ShowinApp"
  ];

  ShowBannersDetails({super.key, required this.BannersbyIdModel});
  String getValueForKey(String key) {
    switch (key) {
      case "id":
        return BannersbyIdModel.id.toString();
      case "title":
        return BannersbyIdModel.title;
      case "titleEn":
        return BannersbyIdModel.titleEn;
      case "url":
        return BannersbyIdModel.url.toString();
      case "status":
        return BannersbyIdModel.status.toString();
      case "image":
        return BannersbyIdModel.image;
      case "ShowinWebSite":
        return BannersbyIdModel.ShowinWebSite.toString();
      case "ShowinApp":
        return BannersbyIdModel.ShowinApp.toString();

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<BannersCubit, BannersState>(
        builder: (context, state) {
          return Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(width: 3, color: Color(0xff3C8DBC)))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomButton(
                              title: 'Edit',
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .07,
                              textcolor: Colors.white,
                              backGroundcolor: const Color(0xff3E7D7A),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            CustomButton(
                              title: 'Delte',
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .07,
                              textcolor: Colors.white,
                              backGroundcolor: const Color(0xffDE6D23),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: keysList.length, // Number of rows
                            itemBuilder: (context, index) {
                              String key = keysList[index];
                              String value = getValueForKey(key);
                              return TableRowWidget(
                                cell1Text: key,
                                cell2Text: value,
                                color: index % 2 == 1
                                    ? const Color(0xffF9F9F9)
                                    : Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
