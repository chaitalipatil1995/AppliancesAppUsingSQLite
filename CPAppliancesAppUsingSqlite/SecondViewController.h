//
//  SecondViewController.h
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPDatabaseManager.h"
@interface SecondViewController : UIViewController<UITextFieldDelegate>
{
    
    UISegmentedControl *segmentControl;
    
}
@property (strong, nonatomic) IBOutlet UITextField *textFieldOne;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (strong, nonatomic) IBOutlet UITextField *textFieldThree;
- (IBAction)segmentAction:(id)sender;
- (IBAction)saveAction:(id)sender;



@end

