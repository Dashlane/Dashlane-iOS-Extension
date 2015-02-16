//
//  DashlaneExtensionRequestHelper.h
//  DashlanePhoneFinal
//
//  Created by Samir on 06/08/14.
//  Copyright (c) 2014 Dashlane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashlaneExtensionConstants.h"

typedef void (^RequestCompletionBlock)(NSDictionary *response, NSError *error);

@interface DashlaneExtensionRequestHelper : NSObject

/**
 Check if a version of Dashlane supporting app extension is installed
 */
+ (BOOL)isDashlaneAppExtensionAvailable;


/**
 @brief Designated intializer of the request helper
 
 Creating an instance of a helper object that can be used to request data from Dashlane. Each request must include non empty
 app name in the request.
 
 @param The name of the app requesting data. This argument cannot be nil.
 */
- (instancetype)initWithAppName:(NSString *)appName NS_DESIGNATED_INITIALIZER;


#pragma mark - Common requests

/**
 @brief Utility methods to common requests
 
 The methods below prepares the data structure needed to build the request. It also presents a UIActivityViewController controller
 instance on the root view controller of the application key window.
 
 @param The completion block is the answer from Dashlane extension. Refer to sendRequestWithCompletionBlock: below for more info 
 about the structure of the NSDictionary returned by the Dashlane extension via this completionBlock
 */
- (void)requestLoginAndPasswordWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestLoginAndPasswordForAService:(NSString *)serviceName withCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestCreditCardWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestAddressWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestIdentityInfoWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestPhoneNumberWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestPassportInfoWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestSignupWithDetail:(NSDictionary *)signupDetail withCompletionBlock:(RequestCompletionBlock)completionBlock; 

#pragma mark - Common store data requests
- (void)requestStoreLoginAndPassword:(NSDictionary *)credentialDetail withCompletionBlock:(RequestCompletionBlock)completionBlock;

#pragma mark - Custom requests

/**
 @brief Prepare the helper to initiate a new request
 
 This method should be called every time a new request needs to be sent. Typically, a request is intiated by calling startNewRequest,
 then a number of calls to addRequest:matchingString, and finally calling sendRequestWithCompletionBlock: to send the request.
 */
- (void)startNewRequest;

- (void)startNewRequestFromViewController:(UIViewController *)viewController;

/**
 @brief Adding a request to the current batch of requests
 
 A request can have multiple "sub" requests to ask for different types of data. Each type of data is identified by a request identifier.
 
 @param The identifier (i.e type) of requested data. Refer to DashlaneExtensionConstants.h to find supported request identifiers. This argument cannot be nil.
 @param An string that is used to filter the requested data. You can pass nil if you don't need it.
 */
- (void)addRequest:(NSString *)requestIdentifier matchingString:(NSString *)stringToMatch;

/**
 @brief Adding a store request to the current batch of requests
 
 
 @param The identifier (i.e type) of the store request. Refer to DashlaneExtensionConstants.h to find supported identifiers. This argument cannot be nil.
 @param The data details dictionnary. Refer to DashlaneExtensionConstants.h for keys to populate this dictionnary depending the type of data you want to store.
 */

- (void)addStoreDataRequest:(NSString *)storeDataRequestIdentifier withDataDetails:(NSDictionary *)dataDetails;

/**
 @brief Add a sign-up request to the current batch of requests
 
 @param The data details dictionnary. Refer to DashlaneExtensionConstants.h for keys to populate this dictionnary depending the type of data you want to store.
 */

- (void)addSignupRequestWithRequestDetails:(NSDictionary *)requestDetails;


/**
 @brief Send the current batch of requests to Dashlane extension.
 
 The current batch of requests are embedded into an NSExtensionItem instance. It is passed to a UIActivityViewController controller instance 
 that is presented on the root view controller of the application key window.
 When the extension is dismissed the block "completionBlock" is called. The NSDictionary argument of the completion block is a dictionary of
 dictionaries mapped to requested "request identifiers". The keys are the requested identifiers (via addRequest:matchingString:) and the values
 are dictionaries of the requested data. Refer to DashlaneExtensionConstants.h to have more information about the keys of these dictionary.

 
 @param The callback block to be called when the extension is dismissed.
 */
- (void)sendRequestWithCompletionBlock:(RequestCompletionBlock)completionBlock;


/**
 Can be called to be used in custom UIActivityController implementation to get the NSExtensionItem of the current batch of requests
 */
- (NSExtensionItem *)extensionItemForCurrentRequests;

@end
