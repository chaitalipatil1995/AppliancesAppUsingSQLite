//
//  FirstViewController.h
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SecondViewController.h"
#import "customTableViewCell.h"
#import "CPDatabaseManager.h"



@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *tvArray;
    NSMutableArray *mobileArray;
    NSMutableArray *acArray;
    UISegmentedControl *segmentControl;
    NSMutableArray *allTasks;

}

@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentControl;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)segmentAction:(id)sender;




@end

