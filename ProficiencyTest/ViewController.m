//
//  ViewController.m
//  ProficiencyTest
//
//  Created by Hirenkumar Patel on 8/3/18.
//  Copyright © 2018 Hirenkumar. All rights reserved.
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *myArr;UIView *navigationalView;
    UILabel *lblTitleNavigational;
}
#define scWi  [[UIScreen mainScreen]bounds].size.width
#define scHi  [[UIScreen mainScreen]bounds].size.height


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self allDevice];
    
    [self main1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ::-------------------All Device Function-------------------------
-(void)allDevice {
    self.mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, scWi, scHi-30)];
    [self.mainView setBackgroundColor:[UIColor colorWithRed:0.35 green:0.64 blue:0.76 alpha:0.57]];
    [self.view addSubview:self.mainView];
    
    
    self.jasonStringLbl = [[UITextView alloc]initWithFrame:CGRectMake(5, 100, self.mainView.frame.size.width-10, 300)];
    [self.jasonStringLbl setTextColor:[UIColor blueColor]];
    [self.mainView addSubview:self.jasonStringLbl];
    [self.jasonStringLbl setScrollEnabled:YES];
    [self.jasonStringLbl.layer setBorderWidth:1.0];
    
    int btnWidth = scWi - 15 - 15;
    btnDisplay = [[UIButton alloc]initWithFrame:CGRectMake(15, self.jasonStringLbl.frame.origin.y+self.jasonStringLbl.frame.size.height+10, btnWidth, 35)];
    [btnDisplay setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnDisplay setTitle:@"Display" forState:UIControlStateNormal];
    [btnDisplay setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btnDisplay setBackgroundColor:[UIColor colorWithRed:0.48 green:0.72 blue:0.72 alpha:0.36]];
    [btnDisplay addTarget:self action:@selector(btnWidth:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:btnDisplay];
    [btnDisplay.layer setBorderWidth:1.0];
    [btnDisplay.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btnDisplay.layer setCornerRadius:8.0];
    
}
-(void)btnWidth:(id)sender{
    NSLog(@"ok");
    navigationalView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scWi, scHi)];
    [navigationalView setBackgroundColor:[UIColor grayColor]];
    [self.mainView addSubview:navigationalView];
    
    int btnWidth = scWi - 15 - 15;
    UIButton *btnBack = [[UIButton alloc]initWithFrame:CGRectMake(15, scHi-35-15-15-15, btnWidth, 35)];
    [btnBack setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnBack setTitle:@"Exit" forState:UIControlStateNormal];
    [btnBack setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btnBack setBackgroundColor:[UIColor colorWithRed:0.48 green:0.72 blue:0.72 alpha:0.36]];
    [btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [navigationalView addSubview:btnBack];
    [btnBack.layer setBorderWidth:1.0];
    [btnBack.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btnBack.layer setCornerRadius:8.0];
    
    int lblWidth = 200;
    int margin = (scWi - lblWidth)/2;
    lblTitleNavigational = [[UILabel alloc]initWithFrame:CGRectMake(margin, 50, lblWidth, 30)];
    [lblTitleNavigational setTextColor:[UIColor blueColor]];
    [lblTitleNavigational setBackgroundColor:[UIColor colorWithRed:0.46 green:0.73 blue:0.73 alpha:0.45]];
    [lblTitleNavigational setTextAlignment:NSTextAlignmentCenter];
    lblTitleNavigational.text = myArr[0][@"title"];
    [navigationalView addSubview:lblTitleNavigational];
    ///////////////////////////////////////////////
    TableViewController  *tblViewController = [[TableViewController alloc]initWithNibName:nil bundle:nil];
    
    tblViewController.myArrFree = myArr;
    //tblViewController.tiv = 100;
    
    [tblViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:tblViewController animated:YES completion:NULL];
}
-(void)btnBack:(id)sender{
    [navigationalView removeFromSuperview];
}

-(void)main {
    /*
    NSURL *internetPath = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"];
    // Retrieve JSON from a web address
    
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *JSONData = [NSData dataWithContentsOfURL:internetPath options:NSDataReadingMappedIfSafe error:&error];
    // This loads JSON from the web into an NSData object called JSONData
    NSLog(@"%@",JSONData);
    NSDictionary *myDictionary = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:JSONData];
    NSLog(@"%@",myDictionary);
     */
    
    NSString *const kMessageBoardURLString = @"https://jsonplaceholder.typicode.com/posts/1";
    NSURL *msgURL = [NSURL URLWithString:kMessageBoardURLString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *messageTask = [session dataTaskWithURL:msgURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *retString = [NSString stringWithUTF8String:[data bytes]];
        
        NSLog(@"json returned: %@", retString);
        
        
    }];
    [messageTask resume];
   
    
    
    
}
#pragma mark ---------:: main function for creation of array from json parsing ::------------------------
-(void)main1{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"facts" ofType:@"json"];
    // Retrieve local JSON file called example.json
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    // Load the file into an NSData object called JSONData
    NSString *myString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",myString);
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"here ia array   %@",json);
    
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    NSLog(@"----------------------------------------------------------");
    
    NSLog(@"Dict......  %@",dataDict[@"title"]);
    
     NSLog(@"----------------------------------------------------------");
    
    NSLog(@"Dict......  %@",dataDict[@"rows"][0][@"title"]);
    NSLog(@"Dict......  %@",dataDict[@"rows"][0][@"description"]);
    NSLog(@"Dict......  %@",dataDict[@"rows"][0][@"imageHref"]);
    
    NSLog(@"----------------------------------------------------------");
    
    
    NSLog(@"Dict......  %@",dataDict[@"rows"][1][@"title"]);
    NSLog(@"Dict......  %@",dataDict[@"rows"][1][@"description"]);
    NSLog(@"Dict......  %@",dataDict[@"rows"][1][@"imageHref"]);
    
    self.jasonStringLbl.text = myString;
    myArr = [[NSArray alloc]init];
    myArr = dataDict[@"rows"];
    NSLog(@"myArrrrrrrryuyy  %lu",(unsigned long)myArr.count);
}



@end
