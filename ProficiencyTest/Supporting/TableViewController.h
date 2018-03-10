//
//  TableViewController.h
//  ProficiencyTest
//
//  Created by Hirenkumar Patel on 10/3/18.
//  Copyright © 2018 Hirenkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITextViewDelegate,UIGestureRecognizerDelegate>

{
    NSArray *myArrFree;
UITableViewCell * theCell;
UITableView *myTableView;
    UIView *baseTableView;
UIButton *btnBack; UIButton *btnRefreshDataForNotification;UIButton *btnPlus;
}
@property NSArray *myArrFree;
@end
