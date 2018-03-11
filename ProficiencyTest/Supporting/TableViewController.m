//
//  TableViewController.m
//  ProficiencyTest
//
//  Created by Hirenkumar Patel on 10/3/18.
//  Copyright © 2018 Hirenkumar. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end
#define scWi  [[UIScreen mainScreen]bounds].size.width
#define scHi  [[UIScreen mainScreen]bounds].size.height

#define WidthRatio scWi/414
#define HeightRatio scHi/736


@implementation TableViewController
{
    UIView *mainView;
    NSMutableArray *myArrPathCollection;NSMutableArray *imageArr;
}
@synthesize myArrFree;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    myArrPathCollection = [[NSMutableArray alloc]init];
    imageArr = [[NSMutableArray alloc]init];
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scWi, scHi)];
    [self allDevice];
    
    for (int i=0;i<myArrFree.count;i++) {
        
        [myArrPathCollection addObject:myArrFree[i][@"imageHref"]];
        
    }
    NSLog(@"path collection     %@",myArrPathCollection[1]);
}

-(void)allDevice{
    
    mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scWi, scHi)];
    [mainView setBackgroundColor:[UIColor lightGrayColor]];
    [mainView accessibilityScroll:UIAccessibilityScrollDirectionUp];
    [self.view addSubview:mainView];
    
    btnBack = [[UIButton alloc]initWithFrame:CGRectMake(5, 35*HeightRatio, 50*WidthRatio, 35*HeightRatio)];
    [btnBack setTitle:@"<<" forState:UIControlStateNormal];
    [btnBack  setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:btnBack];
    
    
    btnRefreshDataForNotification = [[UIButton alloc]initWithFrame:CGRectMake((scWi-210*WidthRatio)/2, 35*HeightRatio, 210*WidthRatio, 35*HeightRatio)];
    [btnRefreshDataForNotification setTitle:@"Refresh" forState:UIControlStateNormal];
    [btnRefreshDataForNotification setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [btnRefreshDataForNotification addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [btnRefreshDataForNotification.titleLabel setFont:[UIFont systemFontOfSize:18*HeightRatio]];
    [btnRefreshDataForNotification.layer setBorderWidth:1.0];
    [btnRefreshDataForNotification.layer setBorderColor:[UIColor blackColor].CGColor];
    [btnRefreshDataForNotification.layer setCornerRadius:4];
    [btnRefreshDataForNotification.layer setBackgroundColor:[UIColor grayColor].CGColor];
    [mainView addSubview:btnRefreshDataForNotification];
    /*
    btnPlus = [[UIButton alloc]initWithFrame:CGRectMake(scWi-45*WidthRatio, 35*HeightRatio, 35*HeightRatio, 35*HeightRatio)];
    [btnPlus setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [btnPlus.titleLabel setFont:[UIFont systemFontOfSize:21*HeightRatio]];
    [btnPlus addTarget:self action:@selector(btnPlus:) forControlEvents:UIControlEventTouchUpInside];
    [btnPlus setTitle:@"+" forState:UIControlStateNormal];
    [btnPlus.layer setBorderWidth:1.0];
    [btnPlus.layer setBorderColor:[UIColor blackColor].CGColor];
    [btnPlus.layer setBackgroundColor:[UIColor grayColor].CGColor];
    [btnPlus.layer setCornerRadius:4];
    [mainView addSubview:btnPlus];
    */
    
    [self createTableView];
    
}
-(void)btnPlus:(id)sender{
    ViewController  *viewController = [[ViewController alloc]initWithNibName:nil bundle:nil];
    
    [viewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:viewController animated:YES completion:NULL];
    
   // [viewController SentNotification];
    
    //[viewController MainPageFunction];
}


-(void)btnBack:(id)sender{
    ViewController  *viewController = [[ViewController alloc]initWithNibName:nil bundle:nil];
    
    [viewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:viewController animated:YES completion:NULL];
    
    //[viewController SentNotification];
    
}
-(void)createTableView{
    [baseTableView removeFromSuperview];
    baseTableView = [[UIView alloc]initWithFrame:CGRectMake(0, 80*HeightRatio, scWi, scHi-80*HeightRatio)];//y 60 ht MyHt - 120
    [baseTableView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:baseTableView];
    
    // int yuyu = (int) Doc_Class.Arr.count*85;
    // NSLog(@"doc_class.Arr.count %lu ",(unsigned long)yuyu);
    // [myTableView removeFromSuperview];
    
    myTableView = [[UITableView alloc]initWithFrame:myTableView.bounds];
    myTableView.frame = CGRectMake(1,1, scWi-2, baseTableView.frame.size.height-2);//y 60 ht MyHt - 120
    [myTableView setBounces:YES];
    [myTableView setDataSource:self];
    [myTableView setDelegate:self];
    [myTableView setRowHeight:0.38*scHi];//80
    
    
    [myTableView setScrollEnabled:YES];
    [myTableView setSeparatorColor:[UIColor redColor]];
    //myTableView.rowHeight = UITableViewAutomaticDimension;
    //myTableView.estimatedRowHeight = 44 ;
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    [myTableView setSeparatorEffect:blurEffect];
    [myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    // [myTableView setBounces:NO];
    [baseTableView addSubview:myTableView];
    [baseTableView bringSubviewToFront:myTableView];
    
    [myTableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return myArrFree.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    static NSString *cellIdentifier = @"cellID";
    
    theCell = [tableView dequeueReusableCellWithIdentifier:
               cellIdentifier];
    if (theCell == nil) {
        
        theCell = [[UITableViewCell alloc]initWithStyle:
                   UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    ////////////To stop over lapping of labels and buttons and shades //////////////////////////////////////////////////////////
    theCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    [theCell setBackgroundColor:[UIColor yellowColor]];
    

    
    
    
    
    for (UIView *vv in [theCell.contentView subviews])
    {
        [vv removeFromSuperview];
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    theCell.tag = (int) indexPath;
    int nnn = (int) indexPath.row;
    NSString *str  = [myArrFree[nnn] valueForKey:@"title"];
    NSLog(@"entered 00");
    // Here check for null value for Dictionary
    if (str == (NSString *)[NSNull null]) {
        NSLog(@"entered 1");
        //str = myArrFree[nnn][@"title"];
        str = @"null";
        
    }else
    {
        NSLog(@"entered 2");
        str = myArrFree[nnn][@"title"];
        
    }
    NSLog(@"count  %lu  count i  %i",(unsigned long)myArrFree.count,nnn);
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(5*WidthRatio, 5*HeightRatio, 200*WidthRatio, 40*HeightRatio)];//w200ht18
    [lblTitle setText:str];
    //NSLog(@"reason ----- ---- - - ->>>>> %@",stringForCell);
    //[lblTask setFont:[UIFont systemFontOfSize:scHt/45]];//17
    [lblTitle setFont:[UIFont systemFontOfSize:HeightRatio*18 weight:0.2]];
    //[lblTask setAdjustsFontSizeToFitWidth:YES];
    [lblTitle setTextColor:[UIColor colorWithRed:0.5 green:0.31 blue:1.0 alpha:1.0]];
    [lblTitle setNumberOfLines:2];
    //[lblTask setContentOffset:CGPointZero animated:YES];
    [theCell addSubview:lblTitle];
    
    
    
    UIImage *image = [[UIImage alloc]init];
    NSString *urlPath = myArrPathCollection[nnn];
    // Here check for null value for Dictionary
    
    if (urlPath == (NSString *)[NSNull null]) {
        NSLog(@"entered 1");
        //str = myArrFree[nnn][@"title"];
        //urlPath = @"null";
        //urlPath = @"noImage.png";
        //NSURL *url = [NSURL URLWithString:urlPath];
        //NSData *data = [NSData dataWithContentsOfURL:url];
        image = [UIImage imageNamed:@"noImage.png"];;
    }else
    {
        NSLog(@"entered 2");
        urlPath = myArrFree[nnn][@"imageHref"];
        urlPath = myArrPathCollection[nnn];
        NSURL *url = [NSURL URLWithString:urlPath];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image = [UIImage imageWithData:data];
        //image = imageArr[nnn];
    }
    

    //UIImageView *imageView = [[UIImageView alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(lblTitle.frame.origin.x+lblTitle.frame.size.width+5, (100*HeightRatio-50*WidthRatio)/2, 150*WidthRatio, 150*WidthRatio)];
    [imageView setAutoresizesSubviews:YES];
    [imageView setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.05]];
    [imageView setImage:image];
    [theCell addSubview:imageView];
    
    
    NSString *strDis  = [myArrFree[nnn] valueForKey:@"description"];
    NSLog(@"entered 000");
    // Here check for null value for Dictionary
    if (strDis == (NSString *)[NSNull null]) {
        NSLog(@"entered 11");
        //str = myArrFree[nnn][@"title"];
        strDis = @"null";
        
    }else
    {
        NSLog(@"entered 22");
        strDis = myArrFree[nnn][@"description"];
        
    }
    NSLog(@"count  %lu  count i  %i",(unsigned long)myArrFree.count,nnn);
    NSLog(@"the cell height  %f and %f and lnl ht %f ",theCell.frame.size.height,scHi*0.32,40*HeightRatio);
    UILabel *lblDis = [[UILabel alloc]initWithFrame:CGRectMake(5*WidthRatio, 235-55, 400*WidthRatio, 50*HeightRatio)];//w200ht18
    [lblDis setText:strDis];
    //NSLog(@"reason ----- ---- - - ->>>>> %@",stringForCell);
    //[lblTask setFont:[UIFont systemFontOfSize:scHt/45]];//17
    [lblDis setFont:[UIFont systemFontOfSize:HeightRatio*12 weight:0.2]];
    //[lblTask setAdjustsFontSizeToFitWidth:YES];
    [lblDis setTextColor:[UIColor colorWithRed:0.5 green:0.31 blue:1.0 alpha:1.0]];
    [lblDis setNumberOfLines:3];
    //[lblTask setContentOffset:CGPointZero animated:YES];
    [theCell addSubview:lblDis];
    
    
    return theCell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //tableCellNo = (int) indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    theCell = [myTableView cellForRowAtIndexPath:indexPath];
    theCell.selectionStyle= UITableViewCellSelectionStyleBlue;
    NSLog(@" indexpath %@",indexPath);
    NSLog(@"insexpath.raw   %li",(long)indexPath.row);
    
}

@end
