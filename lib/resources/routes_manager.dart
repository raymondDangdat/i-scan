import 'package:flutter/material.dart';
import '../ui/add_fund_screens/add_fund_by_card_screen.dart';
import '../ui/add_fund_screens/add_fund_by_hash_it_tag.dart';
import '../ui/add_fund_screens/add_fund_by_transfer.dart';
import '../ui/add_fund_screens/add_fund_by_ussd_screen.dart';
import '../ui/add_fund_screens/add_fund_category_screen.dart';
import '../ui/add_fund_screens/request_fund_screen.dart';
import '../ui/bottom_nav_screen/card/card_created_successfully.dart';
import '../ui/bottom_nav_screen/card/confirm_card_creation_screen.dart';
import '../ui/bottom_nav_screen/card/confirm_card_delivery_details_screen.dart';
import '../ui/bottom_nav_screen/card/create_card_pin_screen.dart';
import '../ui/bottom_nav_screen/card/create_virtual_card_screen.dart';
import '../ui/bottom_nav_screen/card/processing_card_creation_screen.dart';
import '../ui/bottom_nav_screen/card/select_card_type_screen.dart';
import '../ui/bottom_nav_screen/home/more_dashboard_item_screen.dart';
import '../ui/bottom_nav_screen/more/change_pin_and_password_verification_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/confirm_email_to_edit_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/confirm_your_phone_number.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/edit_email_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/edit_phone_number_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/edit_profile_main_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/edit_username_screen.dart';
import '../ui/bottom_nav_screen/more/edit_profile_screens/info_edited_screen.dart';
import '../ui/bottom_nav_screen/more/faq_screen.dart';
import '../ui/bottom_nav_screen/more/faq_screen_details.dart';
import '../ui/bottom_nav_screen/more/help_and_support.dart';
import '../ui/bottom_nav_screen/more/password_reset_flow/password_reset_screen.dart';
import '../ui/bottom_nav_screen/more/password_reset_flow/pin_reset_screen.dart';
import '../ui/bottom_nav_screen/more/security_option_screen.dart';
import '../ui/bottom_nav_screen/more/terms_and_conditions.dart';
import '../ui/bottom_nav_screen/more/more_screen.dart';
import '../ui/bottom_nav_screen/profile/account_details.dart';
import '../ui/bottom_nav_screen/profile/card_order_tracking.dart';
import '../ui/bottom_nav_screen/profile/notification_settings_screen.dart';
import '../ui/bottom_nav_screen/profile/profile_screen.dart';
import '../ui/bottom_nav_screen/send_money/find_friends_screen.dart';
import '../ui/bottom_nav_screen/send_money/hash_payment_screen/hash_payment_screen.dart';
import '../ui/bottom_nav_screen/send_money/hash_payment_screen/web_hash_payment_id_created_screeb.dart';
import '../ui/bottom_nav_screen/send_money/hash_payment_screen/web_hash_payment_summary_screen.dart';
import '../ui/confirm_attendance_screen/confirm_attendance_screen.dart';
import '../ui/confirm_email_screen/confirm_email_screen.dart';
import '../ui/forgot_password_flow/confirm_email_or_phone_number_screen.dart';
import '../ui/forgot_password_flow/forgot_password_screen.dart';
import '../ui/forgot_password_flow/password_reset_successfully_screen.dart';
import '../ui/forgot_password_flow/reset_password_screen.dart';
import '../ui/login_screen/login_passcode_screen.dart';
import '../ui/notice_before_open_account_screen/notice_before_open_account_screen.dart';
import '../ui/splash_screen/splash_screen.dart';
import '../ui/confirm_pass_code_screen/confirm_passcode_screen.dart';
import '../ui/create_pass_code_screen/create_pass_code_screen.dart';
import '../ui/get_started_screen/get_started_screen.dart';
import '../ui/login_screen/login_screen.dart';
import '../ui/sign_up_screen/sign_up_screen.dart';
import 'constants/string_constants.dart';

class Routes {
  static const String splashRoute = "/";
  static const getStartedScreen = "/get_started_screen";
  static const signUpScreen = "/sign_up_screen";
  static const confirmEmailScreen = "/confirm_email_screen";
  static const letsKnowYouScreen = "/lets_know_you_screen";
  static const whatsYourAddressScreen = "/whats_your_screen";
  static const noticeBeforeOpenHashITAccountScreen =
      "/notice_before_open_hash_it_screen";
  static const welcomeToHashITScreen = "/welcome_to_hash_it_screen";
  static const listOfInterestScreen = "/list_of_interest_screen";
  static const selectInterestScreen = "/select_interest_screen";
  static const addFundCategoryScreen = "/add_customer_screen";
  static const addFundByBankTransferScreen = "/add_fund_by_bank_transfer";
  static const addFundByHashItTag = "/add_fund_by_hash_it_tag";
  static const addFundByUSSDScreen = "/add_fund_by_ussd_screen";
  static const addFundByCardScreen = "/add_fund_by_card_screen";
  static const requestMoneyScreen = "/request_money_screen";
  static const accountSetupHome = "/account_setup_home";
  static const bvnVerificationScreen = "/bvn_verification_screen";
  static const recordSelfieInfoScreen = "/record_selfie_info_screen";
  static const recordSelfieScreen = "/record_selfie_screen";
  static const snapSelfieScreen = "/snap_selfie_screen";
  static const createPINScreen = "/create_pin_screen";
  static const confirmPINScreen = "/confirm_pin_scrren";
  static const stepCompletedScreen = "/step_completed_scrren";
  static const moreAboutYouScreen = "/more_about_you_scrren";
  static const primarySourceOfIncomeScreen = "/primary_source_of_scrren";
  static const chooseIdForVerificationInfoScreen =
      "/choose_id_for_verification_info_scrren";
  static const chooseIdForVerificationScreen =
      "/choose_id_for_verification_scrren";
  static const ninVerificationScreen = "/nin_verification_scrren";
  static const setupUsernameScreen = "/setup_username_scrren";
  static const whatDoYouDoScreen = "/what_do_you_do_scrren";
  static const howMuchDoYouScreen = "/how_much_do_you_scrren";
  static const takePhotoScreen = "/take_a_photo_screen";
  static const selfieInfoScreen = "/selfie_info_screen";
  static const reviewInProgressScreen = "/review_in_progress_screen";
  static const sendMoneyOptionScreen = "/send_money_option_screen";
  static const sendMoneySummaryAndConfirmationScreen =
      "/send_money_summary_and_confirmation_screen";
  static const sendMoneyTransactionPINScreen =
      "/send_money_transaction_pin_screen";
  static const sendMoneyToUnsavedAccountWarningScreen =
      "/send_money_to_unsaved_account_warning_screen";
  static const moneySentScreen = "/money_sent_screen";
  static const mobileTopUpScreen = "/mobile_top_up_screen";
  static const buyAirtimeAndDataPINScreen = "/buy_airtime_and_data_pin_screen";
  static const savingsMainScreen = "/savings_main_screen";
  static const stashSavingsMainScreen = "/stash_savings_screen";
  static const goalSavingsScreen = "/goal_savings_screen";
  static const lockSavingsScreen = "/lock_savings_screen";
  static const goalPlanDetailScreen = "/goal_plan_screen";
  static const goalPlanCreatedScreen = "/goal_plan_created_screen";
  static const setGoalSavingsOtherDetailsScreen =
      "/set_goal_settings_other_info_screen";
  static const createGoalSavingsPlanScreen = "/create_goal_savings_plan_screen";
  static const createLockSavingsScreen = "/create_lock_savings_screen";
  static const lockSavingsDurationScreen = "/lock_savings_duration_screen";
  static const webHashPaymentScreen = "/web_hash_payment_screen";
  static const webHashPaymentSummaryScreen = "/web_hash_payment_summary_screen";
  static const webHashPaymentIdCreatedScreen =
      "/web_hash_payment_id_created_screen";
  static const moreDashboardItemsScreen = "/more_dashboard_items_screen";
  static const findFriendsOnHashITScreen = "/find_friends_on_hash_it_screen";
  static const createGiveawayScreen = "/create_giveaway_screen";
  static const giveawayIsLiveScreen = "/giveaway_is_live_screen";
  static const giveawayRequirementsScreen = "/giveaway_requirements_screen";
  static const giveawayIncludeHelpAndCluesScreen =
      "/giveaway_include_help_and_clues_screen";
  static const giveAwayPreviewAndPublishScreen =
      "/giveaway_preview_and_publish_screen";
  static const selectGiveawayDetailsScreen = "/select_giveaway_details_screen";
  static const selectGiveawayTypeScreen = "/select_giveaway_type_screen";
  static const giveawaySocialMediaDetailScreen =
      "/giveaway_social_media_detail_screen";
  static const giveawayAutomationScreen = "/giveaway_automation_screen";
  static const socialMediaGiveawayPreviewScreen =
      "/social_media_giveaway_preview_screen";
  static const socialMediaGiveawayCreatedScreen =
      "/social_giveaway_created_screen";
  static const marketplaceStoreSetupScreen = "/marketplace_store_setup_screen";
  static const defineYourAudienceScreen = "/define_your_audience_screen_screen";
  static const targetAudienceScreen = "/target_audience_screen_screen";
  static const budgetAndDurationScreen = "/budget_and_duration_screen";
  static const promoteProductReviewScreen = "/promote_product_review_screen";
  static const marketplacePaymentScreen = "/marketplace_payment_screen";
  static const productCategoriesScreen = "/product_categories_screen";
  static const productDetailScreen = "/product_detail_screen";
  static const addNewProductScreen = "/add_new_product_screen";
  static const deliveryDetailsScreen = "/delivery_details_screen";
  static const viewOrderScreen = "/view_order_screen";
  static const productsForACategoryScreen = "/products_for_a_category_screen";
  static const productPurchasedSuccessfulScreen =
      "/product_purchased_successful_screen";
  static const cartItemsScreen = "/cart_items_screen";
  static const productPromotedScreen = "/product_promoted_screen";
  static const sellerOrderDetailScreen = "/seller_order_detail_screen";
  static const chatWithSellerScreen = "/chat_with_seller_screen";
  static const marketplaceChatListScreen =
      "/marketplace_chat_list_screen_screen";
  static const activatePromoteProductScreen =
      "/activate_promote_product_screen";
  static const selectSocialAdType = "/select_social_ad_type";
  static const testMoreScreen = "/test_more_screen";
  static const performAndUploadEngagementTaskScreen =
      "/perform_and_upload_engagement_task_screen";

  static const advertMainScreen = "/advert_main_screen";
  static const adAnalyticsScreen = "/ad_analytics_screen";
  static const advertisementDashboardScreen = "/advertisement_dashboard_screen";
  static const uploadProductInfoScreen = "/upload_product_screen";
  static const selectProductToAdvertiseScreen =
      "/select_product_empty_state_screen";
  static const aboutAdvertiseOnHashITScreen =
      "/about_advertise_on_hash_it_screen";
  static const advertiseOnHashITMarketStep1Screen =
      "/about_advertise_on_hash_it_market_step1_screen";
  static const advertiseOnHashITMarketStep2Screen =
      "/about_advertise_on_hash_it_market_step2_screen";
  static const marketplaceMainScreenNewUser = "/marketplace_main_screen";
  static const storeEmptyStateScreen = "/store_empty_state_screen";
  static const addProductScreenStep1 = "/add_product_screen_step1";
  static const addProductScreenStep2 = "/add_product_screen_step2";
  static const marketplaceMainScreenRegisteredUser =
      "/marketplace_main_screen_registered_user";
  static const advertiseOnSocialMediaTasksScreen =
      "/about_advertise_on_social_media_tasks_screen";
  static const createAdvertTaskScreen =
      "/about_advertise_on_social_media_screen";
  static const createSocialMediaTaskScreen = "/social_media_task_screen";
  static const advertPostedOnSocialMediaScreen =
      "/advert_posted_on_social_media_screen";
  static const adsCheckOngoingScreen = "/ads_check_ongoing_screen";
  static const specifyGiveawayNumberOfUsersScreen =
      "/specify_giveaway_number_of_users_screen";
  static const specifyGiveawayPriceOptionScreenScreen =
      "/specify_giveaway_price_option_screen";
  static const lockSavingsSelectOtherInfoScreen =
      "/lockSavingsSelectOtherInfo_screen";
  static const hashItInAppBrowserScreen = "/hash_it_in_app_browser_screen";
  static const airtimeAndDataRechargedSuccessfulScreen =
      "/airtime_and_data_recharged_successfully_screen";
  static const buyDataScreen = "/buy_data_screen";
  static const payABillScreen = "/pay_a_bill_screen";
  static const billPaymentSummaryScreen = "/bill_payment_summary_screen";
  static const billPaymentPINScreen = "/bill_payment_pin_screen";
  static const billPaidSuccessfullyScreen = "/bill_paid_successfully_screen";
  static const earnMainScreen = "/earn_main_screen";
  static const createCardPINScreen = "/create_card_pin_screen";
  static const confirmCardCreationScreen = "/confirm_card_creation_screen";
  static const confirmCardDeliveryDetailScreen =
      "/confirm_card_delivery_detail_screen";
  static const cardDeliveryDetailScreen = "/card_delivery_detail_screen";
  static const processingCardCreationScreen =
      "/processing_card_creation_screen";
  static const downloadTaskToPostScreen = "/download_task_to_post_screen";
  static const proofOfActivityScreen = "/proof_of_activity_screen";
  static const earningReviewHasBegunScreen = "/earning_review_has_begun_screen";
  static const socialMediaTaskOverviewScreen =
      "/social_media_tasks_overview_screen";
  static const completeSocialMediaTaskScreen =
      "/complete_social_media_task_screen";
  static const aboutSocialMediaTaskScreen = "/about_social_media_task_screen";
  static const socialMediaTaskActivatedScreen =
      "/social_media_tasks_activated_screen";
  static const listOfSocialMediaTasksScreen =
      "/list_of_social_media_tasks_screen";
  static const inviteFriendsScreen = "/invite_friends_screen";
  static const performSocialMediaEngagementScreen =
      "/perform_social_media_engagement_screen";
  static const forgotPasswordScreen = "/forgot_password_screen";
  static const resetPasswordScreen = "/reset_password_screen";
  static const passwordResetSuccessfulScreen =
      "/password_reset_successful_screen";
  static const confirmEmailOrPhoneNumberScreen =
      "/confirm_email_or_phone_number_screen";
  static const transactionPINScreen = "/transaction_pin_screen";
  static const resetPINScreen = "/resetPin_pin_screen";
  static const changePasswordScreen = "/change_password_screen";

  static const editProfileScreen = "/edit_profile_screen";
  static const editUsernameScreen = "/edit_username__screen";
  static const profileUpdatedScreen = "/profile_updated_screen";
  static const editPhoneNumberScreen = "/edit_phone_number_screen";
  static const confirmPhoneToEditScreen =
      "/confirm_phone_number_to_edit_phone_number_screen";
  static const editEmailScreen = "/edit_email_to_edit_screen";
  static const confirmEmailToEditScreen = "/confirm_email_to_edit_screen";

  static const onBoardingScreen = "/on_boarding_screen";
  static const loginScreen = "/login_screen";
  static const verifyPhoneNumberScreen = "/verify_phone_screen";
  static const personalDetailsScreen = "/personal_Details_screen";
  static const yourBillingAddress = "/your_billing_address";
  static const infoToVerifyIdentityScreen = "/info_to_verify_screen";
  static const verifyIdentityScreen = "/verify_identity_screen";
  static const cardDetailScreen = "/card_detail_screen_screen";
  static const cardOptionScreen = "/card_option_screen_screen";
  static const swapScreen = "/swap_screen";
  static const withdrawalScreen = "/withdrawal_screen";
  static const withdrawalSummaryScreen = "/withdrawal_summary_screen";
  static const withdrawalPinScreen = "/withdrawal_pin_screen";
  static const withdrawalSuccessfulScreen = "/withdrawal_successful_screen";
  static const billingAddressScreen = "/billing_address_screen";
  static const bankDetailsScreen = "/bank_details_screen";
  static const cardChannelScreen = "/card_channel_screen";
  static const changePinScreen = "/change_pin_screen";
  static const profileDetailScreen = "/profile_detail_screen";
  static const notificationSettingsScreen = "/notification_screens_settings";
  static const cardOrderTrackingScreen = "/card_order_tracking";
  static const createPassCodeScreen = "/create_pass_code";
  static const confirmPassCode = "/ConfirmPasscodeScreen";

  static const emailVerifiedScreen = "/email_verified_screen";
  static const termsAndConditionScreen = "terms_and_condition_screen";

  static const navScreen = "/nav_screen";
  static const newNavScreen = "/new_nav_screen";
  static const selectCardTypeScreen = "/select_card_type_screen";
  static const createVirtualScreen = "/create_virtual_screen";
  static const cardCreatedSuccessfullyScreen =
      "/card_created_successfully_screen";
  static const fiatAssetsScreen = "/fiat_assets_screen";
  static const receivePaymentOptions = "/receive_payment_options";
  static const depositOptionsScreen = "/deposit_options_screen";
  static const sendFundsOptionsScreen = "/send_funds_options_screen";
  static const selectCryptoWalletScreen = "/select_crypto_wallet_screen";
  static const receiveWithKavlrTagScreen = "/receiveWithKavlrTag";
  static const paymentLinkScreen = "/paymentLinkScreen";
  static const paymentLinkOptions = "/paymentLinkOptions";
  static const createPaymentLink = "/create_payment_link";
  static const selectCryptoWalletForSend = "/select_crypto_wallet_for_send";
  static const sendCryptoSummary = "/send_crypto_summary";
  static const transactionPin = "/transaction_pin";
  static const walletTransactionSuccessful =
      "/wallet_transaction_successful_screen";
  static const sendWithTagScreen = "/send_with_tag_screen";
  static const sendToTagWarningScreen = "/send_to_tag_screen";
  static const sendFundsSummary = "/send_fund_summary";
  static const globalTransferScreen = "/global_transfer";
  static const globalPayAmountScreen = "/global_amount_screen";
  static const globalPayAccNoAndBankScreen = "/global_acc_and_bank_screen";
  static const beneficiaryScreen = "/beneficiary_screen";
  static const profileScreen = "/profile_screen";
  static const statementOfAccount = "/statement_of_account";
  static const successScreen = "/success_screen";
  static const securityOptionScreen = "/security_option_screen";
  static const changePinAndPasswordVerificationScreen =
      "/change_pin_and_password_verification_screen";
  // static const changePasswordScreen = "/change_password";
  static const helpAndSupportScreen = "/help_and_support";
  static const faqScreen = "/faq_screen";
  static const faqDetailScreen = "/faq_deatail_screen";
  static const chatWithUsScreen = "/chat_with_us_screen";
  static const termsAndConditionsScreen2 = "/terms_and_screen";
  static const marketPriceScreen = "/marketplace_screen";
  static const marketPriceBuyScreen = "/market_price_buy_screen";
  static const marketPriceSellScreen = "/market_price_sell_screen";
  static const marketPriceOrderSummaryScreen =
      "/market_price_order_summary_screen";
  static const customerScreen = "/customer_screen";

  static const customerDetailScreen = "/customer_detail_screen";
  static const customerAddedSuccessScreen = "/customer_added_success_screen";
  static const kycStep1Screen = "/kyc_step1_screen";
  static const kycStep2Screen = "/kyc_step2_screen";
  static const loginPasscodeScreen = "/login_passcode_screen";
  static const sendMoneyMainScreen = "/send_money_screen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.getStartedScreen:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.confirmEmailScreen:
        return MaterialPageRoute(builder: (_) => const ConfirmEmailScreen());
      case Routes.welcomeToHashITScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmAttendanceScreen());
      case Routes.noticeBeforeOpenHashITAccountScreen:
        return MaterialPageRoute(
            builder: (_) => const NoticeBeforeOpenAccountScreen());
      case Routes.addFundCategoryScreen:
        return MaterialPageRoute(builder: (_) => const AddFundCategoryScreen());
      case Routes.addFundByBankTransferScreen:
        return MaterialPageRoute(
            builder: (_) => const AddFundByBankTransferScreen());
      case Routes.addFundByHashItTag:
        return MaterialPageRoute(
            builder: (_) => const AddFundByHashITTagScreen());
      case Routes.addFundByUSSDScreen:
        return MaterialPageRoute(builder: (_) => const AddFundByUSSDScreen());
      case Routes.addFundByCardScreen:
        return MaterialPageRoute(builder: (_) => const AddByCardScreen());
      case Routes.requestMoneyScreen:
        return MaterialPageRoute(builder: (_) => const RequestFundScreen());
      case Routes.createCardPINScreen:
        return MaterialPageRoute(builder: (_) => const CreateCardPINScreen());
      case Routes.confirmCardCreationScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmCardCreationScreen());
      case Routes.confirmCardDeliveryDetailScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmCardDeliveryDetailScreen());
      // case Routes.cardDetailScreen:
      //   return MaterialPageRoute(builder: (_) => const CardDetailScreen());
      case Routes.processingCardCreationScreen:
        return MaterialPageRoute(
            builder: (_) => const ProcessingCreationScreen());
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.passwordResetSuccessfulScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordResetSuccessfullyScreen());
      case Routes.confirmEmailOrPhoneNumberScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmEmailOrPhoneNumberScreen());
      case Routes.confirmEmailToEditScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmEmailToEditScreen());
      case Routes.confirmPhoneToEditScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmYourPhoneNumberScreen());
      case Routes.editEmailScreen:
        return MaterialPageRoute(builder: (_) => const EditEmailScreen());
      case Routes.editPhoneNumberScreen:
        return MaterialPageRoute(builder: (_) => const EditPhoneNumberScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileMainScreen());
      case Routes.editUsernameScreen:
        return MaterialPageRoute(builder: (_) => const EditUsernameScreen());
      case Routes.profileUpdatedScreen:
        return MaterialPageRoute(builder: (_) => const InfoEditedScreen());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.resetPINScreen:
        return MaterialPageRoute(builder: (_) => const ResetPINScreen());
      case Routes.webHashPaymentScreen:
        return MaterialPageRoute(builder: (_) => const HashPaymentScreen());
      case Routes.webHashPaymentSummaryScreen:
        return MaterialPageRoute(
            builder: (_) => const WebHashPaymentSummaryScreen());
      case Routes.webHashPaymentIdCreatedScreen:
        return MaterialPageRoute(
            builder: (_) => const WebHashPaymentCreatedScreenScreen());
      case Routes.moreDashboardItemsScreen:
        return MaterialPageRoute(
            builder: (_) => const MoreDashboardItemsScreen());
      case Routes.findFriendsOnHashITScreen:
        return MaterialPageRoute(
            builder: (_) => const FindFriendOnHashITScreen());
      case Routes.testMoreScreen:
        return MaterialPageRoute(builder: (_) => const DrSettingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.notificationSettingsScreen:
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsScreen());
      case Routes.cardOrderTrackingScreen:
        return MaterialPageRoute(
            builder: (_) => const CardOrderTrackingScreen());
      case Routes.createPassCodeScreen:
        return MaterialPageRoute(builder: (_) => const CreatePassCodeScreen());
      case Routes.confirmPassCode:
        return MaterialPageRoute(builder: (_) => const ConfirmPasscodeScreen());

      // case Routes.navScreen:
      //   return MaterialPageRoute(builder: (_) => const NavScreen());
      // case Routes.newNavScreen:
      //   return MaterialPageRoute(builder: (_) => NewNavScreen());
      case Routes.selectCardTypeScreen:
        return MaterialPageRoute(builder: (_) => const SelectCardTypeScreen());
      case Routes.createVirtualScreen:
        return MaterialPageRoute(
            builder: (_) => const CreateVirtualCardScreen());
      case Routes.cardCreatedSuccessfullyScreen:
        return MaterialPageRoute(
            builder: (_) => const CardCreatedSuccessfullyScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.securityOptionScreen:
        return MaterialPageRoute(builder: (_) => const SecurityOptionScreen());
      case Routes.changePinAndPasswordVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const ChangePinAndPasswordVerificationScreen());
      // case Routes.changePasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.helpAndSupportScreen:
        return MaterialPageRoute(builder: (_) => const HelpAndSupportScreen());
      case Routes.faqScreen:
        return MaterialPageRoute(builder: (_) => const FaqScreen());
      case Routes.faqDetailScreen:
        return MaterialPageRoute(builder: (_) => const FaqDetailScreen());
      // case Routes.chatWithUsScreen:
      //   return MaterialPageRoute(builder: (_) => const ChatWithUsScreen());
      case Routes.termsAndConditionsScreen2:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsScreen2());
      case Routes.loginPasscodeScreen:
        return MaterialPageRoute(builder: (_) => const LoginPassCodeScreen());
      case Routes.profileDetailScreen:
        return MaterialPageRoute(builder: (_) => const AccountDetailsScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(noRouteFound),
              ),
              body: const Center(
                child: Text(noRouteFound),
              ),
            ));
  }
}
