//
//  LoginViewController.m
//  Travel+Style
//
//  Created by Dashlane.
//  Copyright (c) 2014 Dashlane Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "DashlaneExtensionRequestHelper.h"

@interface LoginViewController ()

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;


@end

@implementation LoginViewController

@synthesize login = _login;
@synthesize password = _password;

@synthesize loginField = _loginField;
@synthesize passwordField = _passwordField;
@synthesize loginButton = _loginButton;
@synthesize loginWithDashlaneButton = _loginWithDashlaneButton;
@synthesize spinner = _spinner;
@synthesize maskView = _maskView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.spinner setHidden:YES];
    [self.maskView setHidden:YES];
    
    UIColor *foregroundColor = [UIColor colorWithRed:184/255.0 green:204/255.0 blue:233/255.0 alpha:1.0];
    [self.loginField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: foregroundColor}]];
    [self.passwordField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: foregroundColor}]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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

- (IBAction)getCredentialsFromDashlane:(id)sender {
    
    DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:@"travelplusstyle"];
    [helper requestLoginAndPasswordWithCompletionBlock:^(NSDictionary *response, NSError *error) {
        
        NSDictionary *dict = [response objectForKey:DASHLANE_EXTENSION_REQUEST_LOGIN];
        self.login = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_LOGIN_KEY];
        self.password = [dict objectForKey:DASHLANE_EXTENSION_REQUEST_REPLY_PASSWORD_KEY];
        
//        [self performSelector:@selector(startLoading) withObject:nil afterDelay:0.5f];
        if (self.login && self.password)
            [self startLoading];
    }];
}

- (BOOL)isUserInputValidForLogin {
    
    return [self.loginField.text length] != 0 && [self.passwordField.text length] != 0;
}

-(IBAction)login:(id)sender {
    
    [self.view endEditing:YES];
    
    if ([self isUserInputValidForLogin] == YES) {
        [self prepareLoading];
    }
    else {
        UIAlertController *errorController = [UIAlertController alertControllerWithTitle:@"" message:@"Invalid email or password" preferredStyle:UIAlertControllerStyleAlert];
        [errorController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:errorController animated:YES completion:nil];
    }
}

- (void)prepareLoading
{
    NSString *title = @"";
    NSString *message = @"Would you like to save your credential in Dashlane?";
    NSString *yesAction = @"Yes";
    NSString *noAction = @"No, thanks";
    
    UIAlertController *saveCredentialController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [saveCredentialController addAction:[UIAlertAction actionWithTitle:noAction style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self startLoading];
    }]];
    
    [saveCredentialController addAction:[UIAlertAction actionWithTitle:yesAction style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *appName = @"travelplusstyle";
        NSString *serviceName = @"travelplusstyle.com";
        
        DashlaneExtensionRequestHelper *helper = [[DashlaneExtensionRequestHelper alloc] initWithAppName:appName];
        
        NSDictionary *credentialDetail = @{DASHLANE_EXTENSION_STORE_REQUEST_LOGIN_KEY: self.loginField.text,
                                           DASHLANE_EXTENSION_STORE_REQUEST_PASSWORD_KEY: self.passwordField.text,
                                           DASHLANE_EXTENSION_STORE_REQUEST_SERVICE_NAME_OR_URL_KEY: serviceName};
        
        [helper requestStoreLoginAndPassword:credentialDetail withCompletionBlock:^(NSDictionary *dictionary, NSError *error) {
            if (error != nil) {
                UIAlertController *errorController = [UIAlertController alertControllerWithTitle:@"Failed to Save Credential" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
                
                [errorController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self startLoading];
                }]];
                
                [self presentViewController:errorController animated:YES completion:nil];
            }
            else {
                [self startLoading];
            }
        }];
    }]];
    
    [self presentViewController:saveCredentialController animated:YES completion:nil];
}

- (void) startLoading {
    [self.spinner setAlpha:0.f];
    [self.maskView setAlpha:0.f];

    [self.spinner setHidden:NO];
    [self.maskView setHidden:NO];
    
    [UIView animateWithDuration:0.5f animations:^{
        [self.maskView setAlpha:0.5f];
    } completion:^(BOOL finished) {
        [self.spinner setAlpha:1.f];
        [self.spinner startAnimating];
        
        [self performSelector:@selector(endLoading) withObject:nil afterDelay:0.5f];
    }];
}

- (void) endLoading {
    [self.spinner stopAnimating];
    [self.maskView setHidden:YES];
    [self.spinner setHidden:YES];
    
    [self.passwordField setTextColor:[UIColor blackColor]];
    [self.loginField setTextColor:[UIColor blackColor]];
    
    [self.passwordField setSecureTextEntry:YES];
    [self.loginField setText:self.login];
    [self.passwordField setText:self.password];
    [self performSelector:@selector(showProfile) withObject:nil afterDelay:0.5f];
}

- (void) showProfile {
    [self performSegueWithIdentifier:@"showProfile" sender:self];
}

- (IBAction)stopEditing:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark - Managing the keyboard

- (void)keyboardWasShown:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGFloat kbPositionY = self.view.frame.size.height - kbSize.height - self.view.frame.origin.y;
    CGFloat offset = 0;
    if ((self.loginField.frame.origin.y + self.loginField.frame.size.height) >= kbPositionY) {
        offset += self.loginField.frame.size.height;
    }
    if ((self.passwordField.frame.origin.y + self.passwordField.frame.size.height) >= kbPositionY) {
        offset += self.passwordField.frame.size.height;
    }
    if ((self.loginButton.frame.origin.y + self.loginButton.frame.size.height) >= kbPositionY) {
        offset += self.loginButton.frame.size.height + 8.0;
    }
    
    CGRect frame = self.view.frame;
    frame.origin.y -= offset;
    [self.view setFrame:frame];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
}

@end
