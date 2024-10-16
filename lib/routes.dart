import 'package:get/get.dart';
import 'package:tartouscovernment/core/constants/route.dart';
import 'package:tartouscovernment/core/middleware/mymiddleware.dart';
import 'package:tartouscovernment/notifications.dart';
import 'package:tartouscovernment/view/Homepage/homepage.dart';
import 'package:tartouscovernment/view/auth/activateaccount.dart';
import 'package:tartouscovernment/view/auth/login.dart';
import 'package:tartouscovernment/view/auth/resetpassword.dart';
import 'package:tartouscovernment/view/auth/resetpasswordconfirmation.dart';
import 'package:tartouscovernment/view/auth/signup.dart';
import 'package:tartouscovernment/view/detilspagee.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/AccountApproval.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/ContractAttachment.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/addacount.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/addhotelaccount.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/availabilityandrateprovider.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/departmentcontactdetails.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/minimumcommisions.dart';
import 'package:tartouscovernment/view/drawerpages/addacount/payment.dart';
import 'package:tartouscovernment/view/drawerpages/amenties/mainamenties.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/addcustomerdetails.dart';
import 'package:tartouscovernment/view/drawerpages/manualreservation/addreservation.dart';

import 'package:tartouscovernment/view/forgetpassword/verifycodeforgetpassword.dart';
import 'package:tartouscovernment/view/onboarding/onboarding.dart';

import 'view/testwidgets.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: "/activate/",
    page: () => ActivateAccountPage(),
  ),
  GetPage(
    name: "/password/reset/confirm/",
    page: () => ResetPasswordConfirmation(),
  ),
  GetPage(
      name: AppRoutes.login,
      page: () => Login(),
      middlewares: [MyMiddleware()]),
// ContractAttachment
  GetPage(
    name: AppRoutes.ContractAttachment,
    page: () => const ContractAttachment(),
  ),
  GetPage(
    name: AppRoutes.Addreservation,
    page: () => const Addreservation(),
  ),
  GetPage(
    name: AppRoutes.AccountApproval,
    page: () => const AccountApproval(),
  ),
  GetPage(
    name: AppRoutes.MinimumCommissions,
    page: () => const MinimumCommissions(),
  ),
  GetPage(
    name: AppRoutes.payment,
    page: () => const Payment(),
  ),
  GetPage(
      name: AppRoutes.signup,
      page: () => Signup(),
      middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.AvailabilityAndRateProvider,
    page: () => const AvailabilityAndRateProvider(),
  ),
  GetPage(
    name: AppRoutes.departmentcontactdetials,
    page: () => const DepartmentContactDetails(),
  ),
  GetPage(
      name: AppRoutes.onboarding,
      page: () => const Onboarding(),
      middlewares: [Onboardingmiddleware()]),
  GetPage(
    name: AppRoutes.success,
    page: () => SuccessSignup(),
  ),
  GetPage(
    name: AppRoutes.addhotelaccount,
    page: () => AddHotelAccount(),
  ),
  GetPage(
    name: AppRoutes.addaccount,
    page: () => AddAccount(),
  ),

  GetPage(name: AppRoutes.verifycode, page: () => VerifycodeForgetpassword()),
  GetPage(name: AppRoutes.testwidget, page: () => AvocadoPage()),

  GetPage(name: AppRoutes.homepage, page: () => HomePage()),
  GetPage(name: AppRoutes.details, page: () => Details()),
  GetPage(name: AppRoutes.notifications, page: () => Notifications()),
  // GetPage(name: AppRoutes.addhotel, page: () => Addhotel()),

  GetPage(
    name: AppRoutes.AddCustomerDetails,
    page: () => const AddCustomerDetails(),
  ),

  GetPage(
    name: AppRoutes.MainAmenties,
    page: () => const MainAmenties(),
    // AddReservatonGuestoptions
  ),
];
