//
//  DashlaneExtensionConstants.m
//  DashlanePhoneFinal
//
//  Created by Samir on 06/08/14.
//  Copyright (c) 2014 Dashlane. All rights reserved.
//

#import "DashlaneExtensionConstants.h"

NSString * const DASHLANE_EXTENSION_REQUEST_LOGIN         = @"com.dashlane.extension.request-login";
NSString * const DASHLANE_EXTENSION_REQUEST_ADDRESS       = @"com.dashlane.extension.request-address";
NSString * const DASHLANE_EXTENSION_REQUEST_CREDIT_CARD   = @"com.dashlane.extension.request-creditcard";
NSString * const DASHLANE_EXTENSION_REQUEST_IDENTITY_INFO = @"com.dashlane.extension.request-identity";
NSString * const DASHLANE_EXTENSION_REQUEST_PHONE_NUMBER  = @"com.dashlane.extension.request-phone";
NSString * const DASHLANE_EXTENSION_REQUEST_PASSPORT_INFO = @"com.dashlane.extension.request-passport";

NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP        = @"com.dashlane.extension.request-signup";
NSString * const DASHLANE_EXTENSION_SIGNUP_REQUESTED_DATA = @"dashlaneExtensionSignupRequestedData";
NSString * const DASHLANE_EXTENSION_SIGNUP_SERVICE_URL    = @"dashlaneExtensionSignupSetviceURL";

NSString * const DASHLANE_EXTENSION_REQUEST_STORE_LOGIN   = @"com.dashlane.extension.request-storeLogin";


NSString * const DASHLANE_EXTENSION_REQUEST_APP_NAME_KEY = @"dashlaneExtensionRequestAppName";


NSString * const DASHLANE_EXTENSION_REQUEST_STRING_TO_MATCH_KEY    = @"dashlaneExtensionRequestStringToMatch";


#pragma mark - Login and Password
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_LOGIN_KEY               = @"dashlaneExtensionRequestReplyLogin";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_EMAIL_KEY               = @"dashlaneExtensionRequestReplyLEmail";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY            = @"dashlaneExtensionRequestReplyPassword";
NSString * const DASHLANE_EXTENSION_STORE_REQUEST_LOGIN_KEY               = @"dashlaneExtensionStoreRequestLogin";
NSString * const DASHLANE_EXTENSION_STORE_REQUEST_PASSWORD_KEY            = @"dashlaneExtensionStoreRequestPassword";
NSString * const DASHLANE_EXTENSION_STORE_REQUEST_SERVICE_NAME_OR_URL_KEY = @"dashlaneExtensionStoreRequestService";

#pragma mark - Address
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_STREET_KEY   = @"dashlaneExtensionRequestReplyAddressStreet";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_STATE_KEY    = @"dashlaneExtensionRequestReplyAddressState";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_COUNTRY_KEY  = @"dashlaneExtensionRequestReplyAddressCountry";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_ADDRESS_ZIP_CODE_KEY = @"dashlaneExtensionRequestReplyAddressZipCode";


#pragma mark - Credit Card
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_COUNTRY_KEY                 = @"dashlaneExtensionRequestReplyCreditCardCountry";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_CARD_HOLDER_NAME_KEY        = @"dashlaneExtensionRequestReplyCreditCardCardHolderName";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_KEY                  = @"dashlaneExtensionRequestReplyCreditCardNumber";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_CCV_KEY              = @"dashlaneExtensionRequestReplyCreditCardCCV";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_NUMBER_KEY     = @"dashlaneExtensionRequestReplyCreditCardIssueNumber";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_MONTH_KEY      = @"dashlaneExtensionRequestReplyCreditCardIssueMonth";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUE_YEAR_KEY       = @"dashlaneExtensionRequestReplyCreditCardIssueYear";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_MONTH_KEY = @"dashlaneExtensionRequestReplyCreditCardExpirationMonth";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_YEAR_KEY  = @"dashlaneExtensionRequestReplyCreditCardExpirationYear";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_ISSUING_BANK_KEY     = @"dashlaneExtensionRequestReplyCreditCardIssuingBank";


#pragma mark - Identity
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_FIRST_NAME_KEY  = @"dashlaneExtensionRequestReplyFirstName";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_LAST_NAME_KEY   = @"dashlaneExtensionRequestReplyLastName";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_MIDDLE_NAME_KEY = @"dashlaneExtensionRequestReplyMiddleName";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_BIRTH_DATE_KEY  = @"dashlaneExtensionRequestReplyBirthDate";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_BIRTH_PLACE_KEY = @"dashlaneExtensionRequestReplyBirthPlace";


#pragma mark - Phone Number
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PHONE_NUMBER_KEY = @"dashlaneExtensionRequestReplyPhoneNumber";


#pragma mark - Passport
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_NUMBER_KEY         = @"dashlaneExtensionRequestReplyNumber";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_DELIVERY_DATE_KEY  = @"dashlaneExtensionRequestReplyDeliveryDate";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_DELIVERY_PLACE_KEY = @"dashlaneExtensionRequestReplyDeliveryPlace";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_EXPIRE_DATE_KEY    = @"dashlaneExtensionRequestReplyExpireDate";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_FULL_NAME_KEY      = @"dashlaneExtensionRequestReplyFullName";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_SEX_KEY            = @"dashlaneExtensionRequestReplySex";
NSString * const DASHLANE_EXTENSION_REQUEST_REPLY_PASSPORT_BIRTH_DATE_KEY     = @"dashlaneExtensionRequestReplyBirthDate";

#pragma mark - Keys for data to request for Sign-ups
NSString * const DASHLANE_EXTENSION_SIGNUP_REQUEST_CREDENTIALS_KEY   = @"dashlaneExtensionSignupRequestCredentials";
NSString * const DASHLANE_EXTENSION_SIGNUP_REQUEST_IDENTITY_INFO_KEY = @"dashlaneExtensionSignupRequestIdentity";
NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP_ADDRESS_KEY       = @"dashlaneExtensionSignupRequestAddress";
NSString * const DASHLANE_EXTENSION_REQUEST_SIGNUP_PHONE_NUMBER_KEY  = @"dashlaneExtensionSignupRequestPhoneNumber";


#pragma mark - Error codes

NSString *const DASHLANE_EXTENSION_ERROR = @"DashlaneExtensionErrorDomain";

NSInteger const DashlaneExtensionErrorInvalidRequest  = 1001;
NSInteger const DashlaneExtensionErrorNoDataFound     = 1002;
NSInteger const DashlaneExtensionErrorUserCancelled   = 1003;