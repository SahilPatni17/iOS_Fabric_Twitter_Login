//
//  ViewController.m
//  FabricWithTwitterLogin
//
//  Created by Sahil Patni on 10/03/17.
//  Copyright © 2017 Sahil Patni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            // Callback for login success or failure. The TWTRSession
            // is also available on the [Twitter sharedInstance]
            // singleton.
            //
            // Here we pop an alert just to give an example of how
            // to read Twitter user info out of a TWTRSession.
            //
            // TODO: Remove alert and use the TWTRSession's userID
            // with your app's user model
            NSString *message = [NSString stringWithFormat:@"@%@ logged in! (%@)",
                                 [session userName], [session userID]];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged in!"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else {
            NSLog(@"Login error: %@", [error localizedDescription]);
        }
    }];
    
    // TODO: Change where the log in button is positioned in your view
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];

    // Do any additional setup after loading the view, typically from a nib.
}

/*
-(void)customButtonWithLogin
{
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error)
     {
         if (session)
         {
             NSLog(@"signed in as %@", [session userName]);
             NSString *message = [NSString stringWithFormat:@"@%@ logged in! (%@)",
                                  [session userName], [session userID]];
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged in!" message:message
                                                            delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
         } else {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];

}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
