import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcometoinvesier.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Invesier'**
  String get welcometoinvesier;

  /// No description provided for @stayconnectedwiththelatestfinancialnewsmarkettrendsandexpertinsightstokeepyouinformedandahead.
  ///
  /// In en, this message translates to:
  /// **'Stay connected with the latest financial news, \nmarket trends, and expert insights to keep you \ninformed and ahead.'**
  String get stayconnectedwiththelatestfinancialnewsmarkettrendsandexpertinsightstokeepyouinformedandahead;

  /// No description provided for @practicewithvirtualcurrency.
  ///
  /// In en, this message translates to:
  /// **'Practice with Virtual \nCurrency'**
  String get practicewithvirtualcurrency;

  /// No description provided for @gainexperiencethroughsimulatedtradingnorisksjustrewards.
  ///
  /// In en, this message translates to:
  /// **'Gain experience through simulated \ntrading. No risks, just rewards.'**
  String get gainexperiencethroughsimulatedtradingnorisksjustrewards;

  /// No description provided for @joinchatslivestreams.
  ///
  /// In en, this message translates to:
  /// **'Join Chats & \nLive Streams'**
  String get joinchatslivestreams;

  /// No description provided for @talktoexpertsjoincommunitiesandgolivetoshareyourinvestmentjourney.
  ///
  /// In en, this message translates to:
  /// **'Talk to experts, join communities, and go \nlive to share your investment journey'**
  String get talktoexpertsjoincommunitiesandgolivetoshareyourinvestmentjourney;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @competeforrewards.
  ///
  /// In en, this message translates to:
  /// **'Compete for Rewards'**
  String get competeforrewards;

  /// No description provided for @climbtheleaderboardunlockperksandearnrealworldopportunities.
  ///
  /// In en, this message translates to:
  /// **'Climb the leaderboard, unlock perks, and \nearn real-world opportunities'**
  String get climbtheleaderboardunlockperksandearnrealworldopportunities;

  /// No description provided for @getstarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getstarted;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @alreadyhaveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyhaveanaccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **' Sign up'**
  String get signup;

  /// No description provided for @otpsentsuccessfullypleaseverifytocontinue.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully. Please verify to continue.'**
  String get otpsentsuccessfullypleaseverifytocontinue;

  /// No description provided for @createanaccount.
  ///
  /// In en, this message translates to:
  /// **' Create an account '**
  String get createanaccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @primaryemail.
  ///
  /// In en, this message translates to:
  /// **'ُEmail'**
  String get primaryemail;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phonenumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phonenumber;

  /// No description provided for @orconnectwith.
  ///
  /// In en, this message translates to:
  /// **'Or connect with'**
  String get orconnectwith;

  /// No description provided for @verifyyourphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Verify your phone number'**
  String get verifyyourphonenumber;

  /// No description provided for @anewcodehasbeensent.
  ///
  /// In en, this message translates to:
  /// **'A new code has been sent'**
  String get anewcodehasbeensent;

  /// No description provided for @otpverifiedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP verified successfully'**
  String get otpverifiedsuccessfully;

  /// No description provided for @authenticationsuccessful.
  ///
  /// In en, this message translates to:
  /// **'Authentication successful'**
  String get authenticationsuccessful;

  /// No description provided for @entertheotpcodesent.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP code sent '**
  String get entertheotpcodesent;

  /// No description provided for @pleaseentertheotp.
  ///
  /// In en, this message translates to:
  /// **'Please enter the OTP'**
  String get pleaseentertheotp;

  /// No description provided for @otpmustbedigits.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 6 digits'**
  String get otpmustbedigits;

  /// No description provided for @resendotpseconds.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP (seconds'**
  String get resendotpseconds;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @verifycode.
  ///
  /// In en, this message translates to:
  /// **'Verify code'**
  String get verifycode;

  /// No description provided for @bycontinuingyouagreeto.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to \n'**
  String get bycontinuingyouagreeto;

  /// No description provided for @termsofuse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsofuse;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @privacypolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy.'**
  String get privacypolicy;

  /// No description provided for @pleaseenteravalidemail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Email'**
  String get pleaseenteravalidemail;

  /// No description provided for @emailmustcontainat.
  ///
  /// In en, this message translates to:
  /// **'Email must contain @'**
  String get emailmustcontainat;

  /// No description provided for @pleaseenteravalidphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get pleaseenteravalidphonenumber;

  /// No description provided for @phonenumbermustbeatleastdigits.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be at least 11 digits'**
  String get phonenumbermustbeatleastdigits;

  /// No description provided for @comingsoon.
  ///
  /// In en, this message translates to:
  /// **'COMING SOON'**
  String get comingsoon;

  /// No description provided for @welcometoinvesierexclamtionmark.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Invesier!'**
  String get welcometoinvesierexclamtionmark;

  /// No description provided for @donthaveanaccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donthaveanaccount;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @trade.
  ///
  /// In en, this message translates to:
  /// **'Trade'**
  String get trade;

  /// No description provided for @learn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learn;

  /// No description provided for @pleasechooseanavatarimage.
  ///
  /// In en, this message translates to:
  /// **'Please choose an avatar image'**
  String get pleasechooseanavatarimage;

  /// No description provided for @pleaseenteraname.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get pleaseenteraname;

  /// No description provided for @namemustbeatleastcharacters.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 4 characters'**
  String get namemustbeatleastcharacters;

  /// No description provided for @profilecompletedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile completed successfully'**
  String get profilecompletedsuccessfully;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'UserName'**
  String get username;

  /// No description provided for @addcomment.
  ///
  /// In en, this message translates to:
  /// **'Add Comment'**
  String get addcomment;

  /// No description provided for @shareyourcomment.
  ///
  /// In en, this message translates to:
  /// **'Share your comment'**
  String get shareyourcomment;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @typeyourreply.
  ///
  /// In en, this message translates to:
  /// **'Type your reply'**
  String get typeyourreply;

  /// No description provided for @pinpost.
  ///
  /// In en, this message translates to:
  /// **'Pin post'**
  String get pinpost;

  /// No description provided for @deletepost.
  ///
  /// In en, this message translates to:
  /// **'Delete post'**
  String get deletepost;

  /// No description provided for @pinaction.
  ///
  /// In en, this message translates to:
  /// **'Pin action'**
  String get pinaction;

  /// No description provided for @deleteaction.
  ///
  /// In en, this message translates to:
  /// **'Delete action'**
  String get deleteaction;

  /// No description provided for @chaseback.
  ///
  /// In en, this message translates to:
  /// **'Chase Back'**
  String get chaseback;

  /// No description provided for @viewprofile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get viewprofile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @areyousureyouwanttologout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areyousureyouwanttologout;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @reportthispostandblocktheaccount.
  ///
  /// In en, this message translates to:
  /// **'Report this post and block the account'**
  String get reportthispostandblocktheaccount;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @reportisdelivereddoyouwanttoblockthisaccount.
  ///
  /// In en, this message translates to:
  /// **'Report is delivered. Do you want to \nblock this account?'**
  String get reportisdelivereddoyouwanttoblockthisaccount;

  /// No description provided for @pioneers.
  ///
  /// In en, this message translates to:
  /// **'  Pioneers'**
  String get pioneers;

  /// No description provided for @fans.
  ///
  /// In en, this message translates to:
  /// **'  Fans'**
  String get fans;

  /// No description provided for @foryou.
  ///
  /// In en, this message translates to:
  /// **'For You'**
  String get foryou;

  /// No description provided for @nopoststodisplay.
  ///
  /// In en, this message translates to:
  /// **'No posts to display'**
  String get nopoststodisplay;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @mypost.
  ///
  /// In en, this message translates to:
  /// **'My Post'**
  String get mypost;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @selectanimagefromyourgalleryorcamera.
  ///
  /// In en, this message translates to:
  /// **'Select an image from your Gallery or Camera'**
  String get selectanimagefromyourgalleryorcamera;

  /// No description provided for @wepostmoneyrelatedcontent.
  ///
  /// In en, this message translates to:
  /// **'We post money related content.....'**
  String get wepostmoneyrelatedcontent;

  /// No description provided for @postnow.
  ///
  /// In en, this message translates to:
  /// **'Post now'**
  String get postnow;

  /// No description provided for @addpost.
  ///
  /// In en, this message translates to:
  /// **'Add Post'**
  String get addpost;

  /// No description provided for @recenttransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recenttransactions;

  /// No description provided for @filterby.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get filterby;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @invees.
  ///
  /// In en, this message translates to:
  /// **'Invees'**
  String get invees;

  /// No description provided for @recharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get recharge;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @transactionshistory.
  ///
  /// In en, this message translates to:
  /// **'Transactions History'**
  String get transactionshistory;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @chase.
  ///
  /// In en, this message translates to:
  /// **'Chase'**
  String get chase;

  /// No description provided for @yesblock.
  ///
  /// In en, this message translates to:
  /// **'Yes, block'**
  String get yesblock;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @blockuser.
  ///
  /// In en, this message translates to:
  /// **'Block user'**
  String get blockuser;

  /// No description provided for @areyousureyouwanttoblockthisaccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to block this \naccount?'**
  String get areyousureyouwanttoblockthisaccount;

  /// No description provided for @requestnotapproved.
  ///
  /// In en, this message translates to:
  /// **'Request not approved !'**
  String get requestnotapproved;

  /// No description provided for @thiscouldbeduetomissingorincorrectinformation.
  ///
  /// In en, this message translates to:
  /// **'This could be due to missing or incorrect information.\nYou still You can send 2 more requests this month.'**
  String get thiscouldbeduetomissingorincorrectinformation;

  /// No description provided for @sendnewrequest.
  ///
  /// In en, this message translates to:
  /// **'Send new Request'**
  String get sendnewrequest;

  /// No description provided for @requestattemptnotice.
  ///
  /// In en, this message translates to:
  /// **'Request attempt notice'**
  String get requestattemptnotice;

  /// No description provided for @youcansendrequestspermonththiswilluseonecontinue.
  ///
  /// In en, this message translates to:
  /// **'You can send 3 requests per month. This will use one. Continue?'**
  String get youcansendrequestspermonththiswilluseonecontinue;

  /// No description provided for @shouldContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get shouldContinue;

  /// No description provided for @requestsuccess.
  ///
  /// In en, this message translates to:
  /// **'Request successful'**
  String get requestsuccess;

  /// No description provided for @accountdeletedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountdeletedsuccessfully;

  /// No description provided for @removeadsenjoyinvesierasyouwish.
  ///
  /// In en, this message translates to:
  /// **'Remove ads, enjoy Invesier as you wish'**
  String get removeadsenjoyinvesierasyouwish;

  /// No description provided for @personaldetails.
  ///
  /// In en, this message translates to:
  /// **'Personal details'**
  String get personaldetails;

  /// No description provided for @applanguage.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get applanguage;

  /// No description provided for @blockerslist.
  ///
  /// In en, this message translates to:
  /// **'Blockers list'**
  String get blockerslist;

  /// No description provided for @deleteaccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteaccount;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @areyousureyouwanttodeleteyouraccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get areyousureyouwanttodeleteyouraccount;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @yourverificationrequesthassent.
  ///
  /// In en, this message translates to:
  /// **'Your verification request has been \nsent successfully !'**
  String get yourverificationrequesthassent;

  /// No description provided for @wewillletyouknowwhenyourverificationrequesthasbeenreviewed.
  ///
  /// In en, this message translates to:
  /// **'We will let you know when your verification \nrequest has been reviewed'**
  String get wewillletyouknowwhenyourverificationrequesthasbeenreviewed;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// No description provided for @jobtitle.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get jobtitle;

  /// No description provided for @companyname.
  ///
  /// In en, this message translates to:
  /// **'Company name'**
  String get companyname;

  /// No description provided for @bankelahly.
  ///
  /// In en, this message translates to:
  /// **'Bank elahly'**
  String get bankelahly;

  /// No description provided for @sociallinks.
  ///
  /// In en, this message translates to:
  /// **'Social Links'**
  String get sociallinks;

  /// No description provided for @uploadidpassport.
  ///
  /// In en, this message translates to:
  /// **'Upload ID / Passport'**
  String get uploadidpassport;

  /// No description provided for @taptouploadfront.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload (Front)'**
  String get taptouploadfront;

  /// No description provided for @sendrequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendrequest;

  /// No description provided for @youreverified.
  ///
  /// In en, this message translates to:
  /// **'You\'re verified !'**
  String get youreverified;

  /// No description provided for @yourrequesthasbeenapprovedyoucannowenjoyourpremiumfeature.
  ///
  /// In en, this message translates to:
  /// **'Your request has been approved. You can now enjoy our premium feature'**
  String get yourrequesthasbeenapprovedyoucannowenjoyourpremiumfeature;

  /// No description provided for @backtohomepage.
  ///
  /// In en, this message translates to:
  /// **'Back to home page'**
  String get backtohomepage;

  /// No description provided for @logoutsuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get logoutsuccess;

  /// No description provided for @verificationrequest.
  ///
  /// In en, this message translates to:
  /// **'Verification request'**
  String get verificationrequest;

  /// No description provided for @taptouploadback.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload (Back)'**
  String get taptouploadback;

  /// No description provided for @nonotificationsyet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get nonotificationsyet;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @viewall.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewall;

  /// No description provided for @otpcode.
  ///
  /// In en, this message translates to:
  /// **'OTP Code'**
  String get otpcode;

  /// No description provided for @usernamemin.
  ///
  /// In en, this message translates to:
  /// **'username'**
  String get usernamemin;

  /// No description provided for @namemin.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get namemin;

  /// No description provided for @reportreasons.
  ///
  /// In en, this message translates to:
  /// **'Report reasons'**
  String get reportreasons;

  /// No description provided for @spam.
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get spam;

  /// No description provided for @scam.
  ///
  /// In en, this message translates to:
  /// **'Scam'**
  String get scam;

  /// No description provided for @illegal.
  ///
  /// In en, this message translates to:
  /// **'Illegal'**
  String get illegal;

  /// No description provided for @violence.
  ///
  /// In en, this message translates to:
  /// **'Violence'**
  String get violence;

  /// No description provided for @hatespeech.
  ///
  /// In en, this message translates to:
  /// **'Hate speech'**
  String get hatespeech;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @reportdelivered.
  ///
  /// In en, this message translates to:
  /// **'Report is delivered. Do you want to \nblock this account?'**
  String get reportdelivered;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yesBlock.
  ///
  /// In en, this message translates to:
  /// **'Yes, block'**
  String get yesBlock;

  /// No description provided for @mate.
  ///
  /// In en, this message translates to:
  /// **'Mate'**
  String get mate;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live;

  /// No description provided for @nopioneersfound.
  ///
  /// In en, this message translates to:
  /// **'No pioneers found'**
  String get nopioneersfound;

  /// No description provided for @challenge.
  ///
  /// In en, this message translates to:
  /// **'Challenge'**
  String get challenge;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @noresultsfound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noresultsfound;

  /// No description provided for @noFansFound.
  ///
  /// In en, this message translates to:
  /// **'No fans found'**
  String get noFansFound;

  /// No description provided for @nopioneerspoststodisplay.
  ///
  /// In en, this message translates to:
  /// **'No pioneers posts'**
  String get nopioneerspoststodisplay;

  /// No description provided for @noforyoupoststodisplay.
  ///
  /// In en, this message translates to:
  /// **'No For You posts'**
  String get noforyoupoststodisplay;

  /// No description provided for @nopostcommenttodisplay.
  ///
  /// In en, this message translates to:
  /// **'Everyone\'s reading, but no one\'s talking… be the first to start!'**
  String get nopostcommenttodisplay;

  /// No description provided for @postpublishsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Post published successfully'**
  String get postpublishsuccessfully;

  /// No description provided for @postdeletedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Post deleted successfully'**
  String get postdeletedsuccessfully;

  /// No description provided for @pleasewritecontentoraddimagebeforesharing.
  ///
  /// In en, this message translates to:
  /// **'Please write content or add an image before sharing'**
  String get pleasewritecontentoraddimagebeforesharing;

  /// No description provided for @pleasewritecomment.
  ///
  /// In en, this message translates to:
  /// **'Please write a comment before submitting'**
  String get pleasewritecomment;

  /// No description provided for @commentpublishsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Comment published successfully'**
  String get commentpublishsuccessfully;

  /// No description provided for @addcommentbotton.
  ///
  /// In en, this message translates to:
  /// **'Add Comment...'**
  String get addcommentbotton;

  /// No description provided for @addreply.
  ///
  /// In en, this message translates to:
  /// **'Add Reply...'**
  String get addreply;

  /// No description provided for @postSent.
  ///
  /// In en, this message translates to:
  /// **'Your post was sent'**
  String get postSent;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
