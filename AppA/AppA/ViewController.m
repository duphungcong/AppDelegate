//
//  ViewController.m
//  AppA
//
//  Created by du phung cong on 11/14/15.
//  Copyright © 2015 du phung cong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)buttonClick:(id)sender {
    // Opens the target app if installed, otherwise displays an error
    UIApplication *targetApplication = [UIApplication sharedApplication];
    NSString *targetPath = @"appB://";
    NSURL *targetURL = [NSURL URLWithString:targetPath];
    if ([targetApplication canOpenURL:targetURL]) {
        [targetApplication openURL:targetURL];
        NSLog(@"Open App B");
    }
    else {
        //Display error
        
        // Use UIAlertView if version of iOS <= 7
        /*
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The App B is not found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
         */
        
        // Use UIAlertController if version of iOS >= 8
        // Ref http://stackoverflow.com/questions/30933965/how-do-i-migrate-from-uialertview-deprecated-in-ios8
        //Step 1: Create a UIAlertController
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                   message: @"The App B is not found"
                                                                            preferredStyle:UIAlertControllerStyleAlert                   ];
        
        //Step 2: Create a UIAlertAction that can be added to the alert
        UIAlertAction* alertAction = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here, eg dismiss the alertwindow
                                 [alertController dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        //Step 3: Add the UIAlertAction ok that we just created to our AlertController
        [alertController addAction:alertAction];
        
        //Step 4: Present the alert to the user
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
