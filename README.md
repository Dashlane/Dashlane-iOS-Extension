Dashlane App Extension for iOS 8
======================

The Dashlane extension help to enhance the following areas of your app: 

1. **Login** – Allow your users to quickly login to your app without the need to remember passwords, or type in details.

2. **Checkout** – Your users can quickly make payments at checkout without having to type their details or even get out their credit card.

3. **Sign-up** – Reducing friction at the sign-in stage is key to getting users into your app and exploring your features.

<br/>
<p align="middle">
<img src="https://hipchat.dashlane.com/files/1/127/Xqr6B3R1nNXbifO/demo.gif" width="478" height="849"> 
</p>

Getting started with setup
======================
Supporting the Dashlane Extension is similar to general iOS 8 Extension support. A UI element (e.g. a UIButton) needs to be added to trigger a [UIActivityViewController](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivityViewController_Class/index.html) instance which is going to present the iOS 8 extension selection UI components. Also, the Dashlane Extension uses [NSItemProvider](https://developer.apple.com/library/prerelease/ios/documentation/Foundation/Reference/NSItemProvider_Class/index.html) to build the request before passing it to the instance of [UIActivityViewController](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivityViewController_Class/index.html) via [NSExtensionItem](https://developer.apple.com/library/ios/documentation/Foundation/Reference/NSExtensionItem_Class/) attachments.

[DashlaneExtensionRequestHelper](https://github.com/Dashlane/Dashlane-iOS-Extension/blob/master/DashlaneExtensionRequestHelper.h) is a utility class that can be used to quickly support the Dashlane Extension. It takes care of creating the proper data structure of the request and presenting a [UIActivityViewController](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivityViewController_Class/index.html) view on the root view controller of the application key window.

What can be requested?
======================
* Login and password
* Address
* Credit Card
* Phone number
* Passport info
* Storing data
* Account creation

Detect the Dashlane app
======================
You may want to detect if your app user has Dashlane installed on their iOS device. Using the following method you'll be able to check if an extension ready version of Dashlane is installed:

```objective-c
+ (BOOL)isDashlaneAppExtensionAvailable;
```

App Name
======================
A request must include a non-empty app name parameter. It is the argument "appName" that needs to be passed to the designated initializer:

```objective-c
- (instancetype)initWithAppName:(NSString *)appName
```

Without a non-empty app name, the extension will return an error.

Implementation example 1: Logging in
======================

```objective-c
DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:@"TravelStyle"];
[helper requestLoginAndPasswordWithCompletionBlock:^(NSDictionary *response, NSError *error) {
NSDictionary *dict = [response objectForKey:DASHLANE_EXTENSION_REQUEST_LOGIN];
  self.login = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_LOGIN_KEY];
  self.password = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY];
  if (self.login && self.password){
    [self startLoading];
  }
}];
```

Implementation example 2: Checkout
======================

```objective-c
DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:@"TravelPlusStyle"];
[helper requestCreditCardWithCompletionBlock:^(NSDictionary *response, NSError *error) {
  NSDictionary *dict = [response objectForKey:DASHLANE_EXTENSION_REQUEST_CREDIT_CARD];
  self.number = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_KEY];
  self.month = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_MONTH_KEY];
  self.year = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_EXPIRATION_YEAR_KEY];
  self.code = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_CREDIT_CARD_NUMBER_CCV_KEY];
  [self performSelector:@selector(startLoading) withObject:nil afterDelay:0.5f];
}];
```

Implementation example 3: Sign-up
======================

```objective-c
DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:@"TravelPlusStyle"];
NSArray *requestedData = @[
                           DASHLANE_EXTENSION_SIGNUP_REQUEST_CREDENTIALS_KEY,
                           DASHLANE_EXTENSION_SIGNUP_REQUEST_IDENTITY_INFO_KEY
                          ];
    
NSDictionary *signupDetails = @{
                                DASHLANE_EXTENSION_SIGNUP_REQUESTED_DATA:   requestedData,
                                DASHLANE_EXTENSION_SIGNUP_SERVICE_URL:      @"http://travelplusstyle.com"
                               };
  
[helper requestSignupWithDetail:signupDetails withCompletionBlock:^(NSDictionary *response, NSError *error) {
  [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    [self.firstName setText:[response objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_FIRST_NAME_KEY]];
    [self.lastName setText:[response objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_IDENTITY_LAST_NAME_KEY]];
    [self.email setText:[response objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_EMAIL_KEY]];
    [self.password setText:[response objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY]];
  }];
}];
```

Implementation example 4: Saving data in Dashlane
======================
```objective-c
NSString *appName = @"TravelPlusStyle";
NSString *serviceName = @"travelplusstyle.com";
DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:appName];

NSDictionary *credentialDetail = @{
                                  DASHLANE_EXTENSION_STORE_REQUEST_LOGIN_KEY: self.loginField.text,
                                  DASHLANE_EXTENSION_STORE_REQUEST_PASSWORD_KEY: self.passwordField.text,
                                  DASHLANE_EXTENSION_STORE_REQUEST_SERVICE_NAME_OR_URL_KEY: serviceName
                                  };
        
[helper requestStoreLoginAndPassword:credentialDetail withCompletionBlock:^(NSDictionary *dictionary, NSError *error) {
  if (error != nil) {
    UIAlertController *errorController = [UIAlertController alertControllerWithTitle:@"Failed to Save Credential" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
                
    [errorController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
      [self startLoading];
    }]];
                
    [self presentViewController:errorController animated:YES completion:nil];
  }else {
    [self startLoading];
  }
}];
```

Utility methods
======================

The DashlaneExtensionRequestHelper class provides a number of utility methods that can be used to to do the most common request from Dashlane:

```objective-c
- (void)requestLoginAndPasswordWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestLoginAndPasswordForAService:(NSString *)serviceName withCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestCreditCardWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestAddressWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestIdentityInfoWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestPhoneNumberWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestPassportInfoWithCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestStoreLoginAndPassword:(NSDictionary *)credentialDetail withCompletionBlock:(RequestCompletionBlock)completionBlock;
- (void)requestSignupWithDetail:(NSDictionary *)signupDetail withCompletionBlock:(RequestCompletionBlock)completionBlock;
```

DashlaneExtensionRequestHelper implementation details
======================

Any request to the Dashlane app extension using DashlaneExtensionRequestHelper follows the following:

**Starting a new request by calling**

```objective-c
- (void)startNewRequest
```
Every new request should start be calling the above method.

**Add at least one request identifier**
Dashlane app extension support 3 types of request:

* **Normal data request**

```objective-c
- (void)addRequest:(NSString *)requestIdentifier matchingString:(NSString *)stringToMatch
```
stringToMatch is used to filter what the extension UI is going to present to the user. Pass nil if you don’t need it.

Multiple data types can be requested using the same request by calling the top methods multiple times for each data type.

Request identifiers are constants defined by Dashlane to recognize requested data types. To learn more, check DashlaneExtensionConstants.

* **Sign-up request**

```objective-c
- (void)addSignupRequestWithRequestDetails:(NSDictionary *)requestDetails;
```

requestDetails is a dictionary that requires two keys, one with describes the data that is requested and another that identifies the URL of your service. To learn more check DashlaneExtensionConstants.

* **Store data requests**

```objective-c
- (void)addStoreDataRequest:(NSString *)storeDataRequestIdentifier withDataDetails:(NSDictionary *)dataDetails;
```

Supported store request identifiers can be found in DashlaneExtensionConstants.

dataDetails contains the data to be stored. Please refer to DashlaneExtensionConstants for the keys to be used (Section: Data details keys for store data requests) 

**Finally send the request by calling**

```objective-c
- (void)sendRequestWithCompletionBlock:(RequestCompletionBlock)completionBlock
```

The completion block is the callback that’s going to be called once the extension is dismissed.

A completionBlock is defined as:

```objective-c
typedef void (^RequestCompletionBlock)(NSDictionary *returnedItems, NSError *error);
```

Structure of the returned items
======================

When the extension is dismissed, the (RequestCompletionBlock) completion block is called with a dictionary representing the answer from the Dashlane Extension:

**Normal data request case**
The dictionary contains, for each requested data type (i.e. requestIdentifier), a dictionary representation of a returned user data item. The keys for the dictionary representations of returned user data items can be found in [DashlaneExtensionConstants[(https://raw.githubusercontent.com/Dashlane/Dashlane-iOS-Extension/master/DashlaneExtensionConstants.h).

Example of a returnedItems dictionary:

```objective-c
{
DASHLANE_EXTENSION_REQUEST_ADDRESS      : {DASHLANE_EXTENSION_REQUEST_REPLY_LOGIN_KEY: @“a login”, DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY : @“a password"},
DASHLANE_EXTENSION_REQUEST_PHONE_NUMBER : {DASHLANE_EXTENSION_REQUEST_REPLY_PHONE_NUMBER_KEY: @“a phone number"}
}
```

**Sign-up request case**

The dictionary contains two keys, here is an example:

```objective-c
{
DASHLANE_EXTENSION_SIGNUP_REQUESTED_DATA      : [DASHLANE_EXTENSION_SIGNUP_REQUEST_CREDENTIALS_KEY, DASHLANE_EXTENSION_SIGNUP_REQUEST_IDENTITY_INFO_KEY],
DASHLANE_EXTENSION_SIGNUP_SERVICE_URL : @"https://yourwebsite.com"
}
```

**Custom UIActivtyController**

If you are using your own UIActivityController. DashlaneExtensionRequestHelper provides a method to returns the NSExtensionItem related to the current batch of requests. So after starting a new request, and adding requests identifiers. Instead of calling sending request directly, you can call:

```objective-c
- (NSExtensionItem *)extensionItemForCurrentRequests
```

Webview forms
======================
Filling webview forms starts by requesting the data from Dashlane. Then by running a simple Javascript code, you can pass the requested information into to the webview:

```objective-c
NSString *javascript = [NSString stringWithFormat:@"!!function(e,t){var l=document.querySelectorAll('input[type=\"text\"],input[type=\"email\"]'),u=document.querySelectorAll('input[type=\"password\"]'),n=document.querySelectorAll('input[type=\"submit\"],button[type=\"submit\"]');return u&&u.length&&l&&l.length?(l[0].value=e,u[0].value=t,n.length&&n[0].click(),!0):!1}(\"%@\",\"%@\");", myLogin, myPassword];
[webView stringByEvaluatingJavaScriptFromString:javascript];
```

Dashlane-Extension CocoaPod
======================
If you use CocoaPods to manage your third party libraries. You can add " pod 'Dashlane-Extension' " to your Podfile, run pod install from your project directory and you're ready to go.

Contact Us
======================
We hope you’ve found everything you need to get started. If you're interested or have any questions, please email us at ios8@dashlane.com.
