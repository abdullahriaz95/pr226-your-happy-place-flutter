// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(statusCode, message) =>
      "Unable to complete action. Server error (${statusCode}):\n${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addYourHappyPlace":
            MessageLookupByLibrary.simpleMessage("Add your happy place"),
        "apiError": m0,
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "entPass":
            MessageLookupByLibrary.simpleMessage("Please enter a Password"),
        "entVEmain": MessageLookupByLibrary.simpleMessage(
            "The format doesn\'t look right. Please check again"),
        "enter_bio": MessageLookupByLibrary.simpleMessage("Enter bio"),
        "enter_confirm_password":
            MessageLookupByLibrary.simpleMessage("Enter same password"),
        "enter_current_password":
            MessageLookupByLibrary.simpleMessage("Enter current signup"),
        "enter_email": MessageLookupByLibrary.simpleMessage("Enter email"),
        "enter_first_name":
            MessageLookupByLibrary.simpleMessage("Enter first name"),
        "enter_last_name":
            MessageLookupByLibrary.simpleMessage("Enter last name"),
        "enter_location":
            MessageLookupByLibrary.simpleMessage("Enter location"),
        "enter_new_password":
            MessageLookupByLibrary.simpleMessage("Enter new password"),
        "enter_post_caption":
            MessageLookupByLibrary.simpleMessage("Enter post caption"),
        "enter_username":
            MessageLookupByLibrary.simpleMessage("Enter user name"),
        "explore": MessageLookupByLibrary.simpleMessage("Explore"),
        "howAreYouFeeling":
            MessageLookupByLibrary.simpleMessage("How are you Feeling?"),
        "howDoYouFeelAboutThisPlace": MessageLookupByLibrary.simpleMessage(
            "How do you Feel about this place?"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "logoutAlertMessage": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to log out?"),
        "myHappiness": MessageLookupByLibrary.simpleMessage("My Happiness"),
        "my_posts": MessageLookupByLibrary.simpleMessage("My Posts"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "passLength": MessageLookupByLibrary.simpleMessage(
            "Password must be 8 characters long"),
        "previous": MessageLookupByLibrary.simpleMessage("Previous"),
        "select_someone_first":
            MessageLookupByLibrary.simpleMessage("Select someone first"),
        "shared_with_me":
            MessageLookupByLibrary.simpleMessage("Shared with Me"),
        "signupEmptyEmail":
            MessageLookupByLibrary.simpleMessage("Please enter your Email"),
        "view_all_posts":
            MessageLookupByLibrary.simpleMessage("View all Posts"),
        "we_keep_your_posts": MessageLookupByLibrary.simpleMessage(
            "We keep your posts private unless you want to share. Who do you want to share with?"),
        "whatAreYouDoing":
            MessageLookupByLibrary.simpleMessage("What are you doing here?"),
        "whereAreYou": MessageLookupByLibrary.simpleMessage("Where are you?"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
