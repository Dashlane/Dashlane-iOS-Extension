//
//  SignupViewController.m
//  Travel+Style
//
//  Created by Rew Islam on 10/02/2015.
//  Copyright (c) 2015 Dashlane Inc. All rights reserved.
//

#import "SignupViewController.h"
#import "DashlaneExtensionRequestHelper.h"

@interface SignupViewController ()

@property (nonatomic, strong) IBOutlet UITextField *firstName;
@property (nonatomic, strong) IBOutlet UITextField *lastName;
@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UIButton *signup;

-(IBAction)showActionView:(id)sender;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//
// IBActions
//

-(IBAction)showActionView:(id)sender {
    DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:@"TravelStyle"];
    
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
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.signup sendActionsForControlEvents:UIControlEventTouchUpInside];
            });
        }];
    }];
}
@end
