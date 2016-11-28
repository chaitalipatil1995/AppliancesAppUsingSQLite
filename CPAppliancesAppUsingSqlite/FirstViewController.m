//
//  FirstViewController.m
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    allTasks = [[NSMutableArray alloc]init];
    tvArray = [[NSMutableArray alloc]init];
    mobileArray = [[NSMutableArray alloc]init];
    acArray  = [[NSMutableArray alloc]init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewDidAppear:(BOOL)animated {
    [self reloadAll];

}



-(void)fetchAllTVs {
    
    if (tvArray.count > 0) {
        [tvArray removeAllObjects];
    }
    tvArray = [[CPDatabaseManager sharedManager]getAllTaskForTV];
    
    [self.myTableView reloadData];
}

-(void)fetchAllMobiles {
    
    if (mobileArray.count > 0) {
        [mobileArray removeAllObjects];
    }
    mobileArray = [[CPDatabaseManager sharedManager]getAllTaskForMobile];
    [self.myTableView reloadData];

}

-(void)fetchAllACs {
    
    if (acArray.count > 0) {
        [acArray removeAllObjects];
    }
    acArray = [[CPDatabaseManager sharedManager]getAllTaskForAC];
    [self.myTableView reloadData];

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (segmentControl.selectedSegmentIndex == 0) {
        return tvArray.count;
    }
    else if (segmentControl.selectedSegmentIndex == 1){
        return mobileArray.count;
    }
    else if (segmentControl.selectedSegmentIndex == 2){
        return acArray.count;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"device_cell"];
    
    if (self.mySegmentControl.selectedSegmentIndex == 0) {
        
        if([[[CPDatabaseManager sharedManager]getAllTaskForTV]valueForKey:@"TV"])
        {

            
        NSDictionary *TvDevice = [tvArray objectAtIndex:indexPath.row];
            NSLog(@"%@",TvDevice);
//                if ([TvDevice valueForKey:@"TV"]) {

        
        cell.labelOne.text = [TvDevice valueForKey:@"company"];
        cell.labelTwo.text = [TvDevice valueForKey:@"model"];
        cell.labelThree.text = [TvDevice valueForKey:@"price"];
//                      return cell;
//                }
        
        }
    
    }
    else if(self.mySegmentControl.selectedSegmentIndex ==  1){
//         customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"device_cell"];
        
        
        NSDictionary *MobileDevice = [mobileArray objectAtIndex:indexPath.row];
        NSLog(@"%@",MobileDevice);

        if ([MobileDevice valueForKey:@"MOBILE"]) {

        cell.labelOne.text = [MobileDevice valueForKey:@"company"];
        cell.labelTwo.text = [MobileDevice valueForKey:@"model"];
        cell.labelThree.text = [MobileDevice valueForKey:@"price"];
//              return cell;
    }
    }
    else if(self.mySegmentControl.selectedSegmentIndex ==  2){
//         customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"device_cell"];
        
        
        NSDictionary *ACDevice = [acArray objectAtIndex:indexPath.row];
        NSLog(@"%@",ACDevice);

        if ([ACDevice valueForKey:@"AC"]) {

        cell.labelOne.text = [ACDevice valueForKey:@"company"];
        cell.labelTwo.text = [ACDevice valueForKey:@"model"];
        cell.labelThree.text = [ACDevice valueForKey:@"price"];

//          return cell;
    }
    }
    return cell;
}



///////////////////////////////////////////////////////////////////////////////////////



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // NSLog(@"Delete");
    
    if (segmentControl.selectedSegmentIndex == 0) {
        
        NSString *task = [tvArray objectAtIndex:indexPath.row];
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"tv_id"]];

//        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",task.uppercaseString];
        
        if ([[CPDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadAll];
        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        
        NSString *task = [mobileArray objectAtIndex:indexPath.row];
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"mobile_id"]];

//        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",task.uppercaseString];
        
        if ([[CPDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadAll];

        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
    }
    else if (segmentControl.selectedSegmentIndex == 2) {
        
        NSString *task = [acArray objectAtIndex:indexPath.row];
        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",[task valueForKey:@"ac_id"]];

//        NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM DEVICE_TABLE WHERE DEVICE_ID = '%@'",task.uppercaseString];
        
        if ([[CPDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
            NSLog(@"Successfully Deleted");
            [self reloadAll];

        }
        else {
            NSLog(@"Failed to Delete Task.");
            
        }
    }
    
    
    
}

-(void)reloadAll {
    
    if (self.mySegmentControl.selectedSegmentIndex == 0) {
        
        [self fetchAllTVs];
    }
    else if (self.mySegmentControl.selectedSegmentIndex == 1){
        
        [self fetchAllMobiles];
        
    }
    else if (self.mySegmentControl.selectedSegmentIndex == 2){
        
        [self fetchAllACs];
    }
}

- (IBAction)segmentAction:(id)sender {
    
    UISegmentedControl *segment = sender;
    
    if (segment.selectedSegmentIndex == 0) {
        
        [self fetchAllTVs];
    }
    else if (segment.selectedSegmentIndex == 1){
        
        [self fetchAllMobiles];
        
    }
    else if (segment.selectedSegmentIndex == 2){
        
        [self fetchAllACs];
    }
}

@end
