import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:path/path.dart' as p;

import 'package:sizer/sizer.dart';
import 'package:tartouscovernment/controller/addacount/addaccontcontroller.dart';
import 'package:tartouscovernment/core/class/handlingdataview.dart';
import 'package:tartouscovernment/core/constants/apptextstyle.dart';
import 'package:tartouscovernment/core/constants/colors.dart';
import 'package:tartouscovernment/core/constants/imageassets.dart';
import 'package:tartouscovernment/core/constants/route.dart';
import 'package:tartouscovernment/core/functions/clicable.dart';
import 'package:tartouscovernment/core/functions/uploadfile.dart';
import 'package:tartouscovernment/data/model/Country_city.dart';
import 'package:tartouscovernment/view/appIcons.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/addedHotelcard.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/custom_clips.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/custom_country_dialogue.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/widgets/custom_slide_switcher.dart';
import 'package:tartouscovernment/view/drawerpages/amenties/functions/dialogus.dart';
import 'package:tartouscovernment/controller/addacount/addaccontcontroller.dart';
import 'package:url_launcher/url_launcher.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    AddAccountController controller = Get.put(AddAccountController());
    return Scaffold(
      extendBody: true, // <--- do not forget mark this as true
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(bottom: 12.sp),
          width: 50.w,
          height: 7.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.sp),
              color: AppColors.main),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Clicable(
                ontap: () {
                  showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: (context) => StatefulBuilder(
                      builder: (ctx, setState) => CustomCountryDilogue(
                        languageCode: "EN",
                        // style: PickerDialogStyle(),
                        filteredCountries: countries,
                        searchText: "serach",
                        countryList: countries!,

                        onCountryChanged: (List<Country> country) async {
                          print(country);
                          country.forEach((element) async {
                            if (!controller.countreyfilter.contains(element)) {
                              controller.countreyfilter.add(element);
                            }
                            print(
                                "Country filter after add ---${element.name}");
                            final states =
                                await getStatesOfCountry(element.code);
                            print(
                                "states for selected country  after add ---${states}");
                            controller.CSC.add(CountryCityModel(
                                name: element.name,
                                cities: states.map((e) => e.name).toList()));

                            print(controller.CSC[0].toJson());
                          });

                          // controller.states = await getStatesOfCountry(
                          //     country.code);
                        },
                        selectedCountry: controller.countreyfilter,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Iconify(AppIcons.equaltor),
                    Container(
                      width: 15.w,
                      child: const Text(
                        'Country',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: 3.sp,
                height: 7.h,
                alignment: Alignment.center,
              ),
              Clicable(
                ontap: () {
                  !controller.countreyfilter.isEmpty
                      ? Get.defaultDialog(
                          title: "Select City",
                          content: Container(
                            height: 50.h,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...List.generate(
                                      controller.CSC.length,
                                      (index) => Container(
                                            margin: EdgeInsets.only(top: 12.sp),
                                            color: Colors.amber,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Card(
                                                  child: Text(
                                                    controller.CSC[index].name
                                                        .toString(),
                                                    style: AppTextStyle.main,
                                                  ),
                                                ),
                                                ...List.generate(
                                                    controller.CSC[index]
                                                        .cities!.length,
                                                    (i) => Text(controller
                                                        .CSC[index].cities![i]
                                                        .toString()))
                                              ],
                                            ),
                                          ))
                                ],
                              ),
                            ),
                          ))
                      : Get.snackbar("Warning", "Select Country first");
                },
                child: Row(
                  children: [
                    const Iconify(AppIcons.equaltor),
                    Container(
                      width: 15.w,
                      child: const Text(
                        ' City',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(
          title: "Add Account",
          ontapaction: () {
            showMenu(
                context: context,
                position: RelativeRect.fromLTRB(129, 10.h, 12, 12),
                items: [
                  PopupMenuItem(
                    onTap: () {
                      Get.toNamed(AppRoutes.addhotelaccount);
                    },
                    child: const Row(
                      children: [Icon(Icons.add), Text('New Account ')],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () async {
                      controller.uplodedexcelfile = await uploadexcelfile();
                      if (controller.uplodedexcelfile != null) {
                        print(controller.uplodedexcelfile!.path);
                        print(p.extension(controller.uplodedexcelfile!.path));
                        if (p.extension(controller.uplodedexcelfile!.path) !=
                            ".xlsx") {
                          Get.snackbar('Error', 'File is not excel type',
                              backgroundColor: Colors.red.withOpacity(0.1),
                              snackPosition: SnackPosition.TOP);
                        } else {
                          await controller.uploadexcelfiles();
                        }
                      } else {
                        Get.snackbar('Error', 'No file selected',
                            backgroundColor: Colors.red.withOpacity(0.1),
                            snackPosition: SnackPosition.TOP);
                      }
                    },
                    child: const Row(
                      children: [Icon(Icons.add), Text('Upload excel file')],
                    ),
                  ),
                ]);
          }),
      body: RefreshIndicator(
        onRefresh: () async {
          if (controller.hotels.isNotEmpty) {
            Get.snackbar("Warning", "Hotel list updated");
          } else {
            await controller.viewhotels();
          }
        },
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideSwitcher(
                  first: 'Manual',
                  second: 'Requested',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(12.sp),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomClips(
                      name: 'Hotels',
                      iconasString: AppIcons.hotel,
                    ),
                    CustomClips(
                      name: 'Activity',
                      iconasString: AppIcons.Activity,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                    CustomClips(
                      name: 'Accounts',
                      iconasString: AppIcons.person,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:
                      GetBuilder<AddAccountController>(builder: (controller) {
                    return Handlingdataview(
                        statusrequest: controller.statusrequest,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              controller.filteredHotels.length,
                              (index) => Clicable(
                                ontap: () {
                                  Get.toNamed(AppRoutes.addhotelaccount,
                                      arguments: {
                                        "hotel": controller.hotels[index]
                                      });
                                },
                                child: AddedHotelCard(
                                  oncall: () async {
                                    String phone = controller
                                        .hotels[index].phone
                                        .toString();
                                    if (phone == "") {
                                      Get.snackbar("Warning",
                                          "phone number not available");
                                    } else {
                                      await launchUrl(Uri.parse('tel:$phone'));
                                    }
                                  },
                                  oncancel: () {
                                    showdeletedialogue(() {
                                      controller.deletehotel(controller
                                          .hotels[index].id!
                                          .toString());
                                    }, "Delete Hotel Data");
                                  },
                                  image: ImageAssets.profile,
                                  name: controller.hotels[index].nameen!,
                                  location:
                                      controller.hotels[index].location ?? "",
                                ),
                              ),
                            )
                          ],
                        ));
                  })),
            )
          ],
        ),
      ),
    );
  }

  getStatesOfCountry(String code) {}
}
