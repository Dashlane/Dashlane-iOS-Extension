//
//  DashlaneExtensionConstants.h
//  DashlanePhoneFinal
//
//  Created by Samir on 06/08/14.
//  Copyright (c) 2014 Dashlane. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - Request Identifiers

/**
 @brief Identifiers for supported request types.
 
 A request identifier is required for each type of data to be requested. When creating an NSItemProvider ([NSItemProvider initWithItem:typeIdentifier:]) to initiate a request,
 the typeIdentifier argument will be one of the request identifiers below.
 
 */

extern NSString * const DASHLANE_EXTENSION_REQUEST_LOGIN;
extern NSString * const DASHLANE_EXTENSION_REQUEST_ADDRESS;
extern NSString * const DASHLANE_EXTENSION_REQUEST_CREDIT_CARD;
extern NSString * const DASHLANE_EXTENSION_REQUEST_IDENTITY_INFO;//first name, date of birth etc.
extern NSString * const DASHLANE_EXTENSION_REQUEST_PHONE_NUMBER;
extern NSString * const DASHLANE_EXTENSION_REQUEST_PASSPORT_INFO;


/**
 @brief Identifiers for supported saving data request types
 
 The following request identifiers can be used to ask Dashlane to save data. Please refer to the "Data details keys for store data requests" section for the data details keys
 you need to provide.

 */

extern NSString * const DASHLANE_EXTENSION_REQUEST_STORE_LOGIN;




/**
 @brief Sign-up/Account creation request
 The following keys are related to sign-up/account creation request. 
 The request identifier is "DASHLANE_EXTENSION_REQUEST_SIGNUP".
 For each sign-up request, a dictionary of two items are required: 
 1- DASHLANE_EXTENSION_SIGNUP_SERVICE_URL which is a string representing the service name of even better, its URL
 2- DASHLANE_EXTENSION_SIGNUP_REQUESTED_DATA which is an array of the data needed for your account creation form
 */
extern NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP;
extern NSString * const DASHLANE_EXTENSION_SIGNUP_REQUESTED_DATA;
extern NSString * const DASHLANE_EXTENSION_SIGNUP_SERVICE_URL;
//Keys for data needed
extern NSString * const DASHLANE_EXTENSION_SIGNUP_REQUEST_CREDENTIALS_KEY;//username, email and password
extern NSString * const DASHLANE_EXTENSION_SIGNUP_REQUEST_IDENTITY_INFO_KEY;//first name, last name, middle name, birth date, birth place
extern NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP_ADDRESS_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP_PHONE_NUMBER_KEY;




#pragma mark - Request userInfo Keys

/**
 @brief Mandatory information to provide with each request
 
 Each request (i.e. NSExtensionItem) must include non empty app name in its userInfo
 
 */
extern NSString * const DASHLANE_EXTENSION_REQUEST_APP_NAME_KEY;




#pragma mark - Request NSItemProvider Info Keys

/**
@brief An optional string that can be used to filter the requested data.
*/
extern NSString * const DASHLANE_EXTENSION_REQUEST_STRING_TO_MATCH_KEY;




#pragma mark - Reply keys

/**
 @brief Keys of the returned requested data. 
 
 Dashlane Extension returns an NSDictionary of dictionaries. The keys are the requested "request identifiers". 
 The values are dictionaries of the requested data. The keys of these last dictionaries depend on the type of requested
 data and can be found below
 
 */

#pragma mark - Login and Password
/**
 For Login and Password requests, if the parameter "DASHLANE_EXTENSION_REQUEST_STRING_TO_MATCH_KEY" is nil. Dashlane Extension
 will present items that are matching the app name (i.e. DASHLANE_EXTENSION_REQUEST_APP_NAME_KEY)
 */
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_LOGIN_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_EMAIL_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY;


#pragma mark - Address
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_STREET_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_STATE_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_COUNTRY_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_ZIP_CODE_KEY;


#pragma mark - Credit Card
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_COUNTRY_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_CARD_HOLDER_NAME_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_CCV_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_NUMBER_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_MONTH_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_YEAR_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_MONTH_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_YEAR_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUING_BANK_KEY;


#pragma mark - Identity 
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_FIRST_NAME_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_LAST_NAME_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_MIDDLE_NAME_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_BIRTH_DATE_KEY;//A string containing timestamp
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_BIRTH_PLACE_KEY;


#pragma mark - Phone Number
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PHONE_NUMBER_KEY;//A string containing a non formatted phone number;


#pragma mark - Passport
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_NUMBER_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_DELIVERY_DATE_KEY;//A string containing timestamp
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_DELIVERY_PLACE_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_EXPIRE_DATE_KEY;//A string containing timestamp
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_FULL_NAME_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_SEX_KEY;
extern NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_BIRTH_DATE_KEY;//A string containing timestamp




#pragma mark - Data details keys for store data requests

/**
 @brief Keys of what the can the data details dictionary can contains
 
 For each store data request. A dictonary representing the data details is needed. The keys that the dictionary can contain depends on the
 the type the data item to store.
 
 */

#pragma mark - Login and Password
extern NSString * const DASHLANE_EXTENSION_STORE_REQUEST_LOGIN_KEY;
extern NSString * const DASHLANE_EXTENSION_STORE_REQUEST_PASSWORD_KEY;
extern NSString * const DASHLANE_EXTENSION_STORE_REQUEST_SERVICE_NAME_OR_URL_KEY;




#pragma mark - Error codes

extern NSString * const DASHLANE_EXTENSION_ERROR;

extern NSInteger const DashlaneExtensionErrorInvalidRequest;
extern NSInteger const DashlaneExtensionErrorNoDataFound;
extern NSInteger const DashlaneExtensionErrorUserCancelled;