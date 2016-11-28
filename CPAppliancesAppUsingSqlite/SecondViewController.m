//
//  SecondViewController.m
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void)saveTaskWithSegment {
    
    if (segmentControl.selectedSegmentIndex == 0) {
        
        [self saveTask];
        
    }
    else if (segmentControl.selectedSegmentIndex == 1){
        
        [self saveTask];
        
    }
    else if (segmentControl.selectedSegmentIndex == 2){
        
        [self saveTask];
        
    }
    
    
}

-(void)saveTask {
    
    NSString *company = self.textFieldOne.text;
    
    NSString *model = self.textFieldTwo.text;
    
    NSString *price = self.textFieldThree.text;
    
    
    //////////////////////////////////////////////
    
    if (segmentControl.selectedSegmentIndex == 0) {
        
        
        if (company.length > 0) {
            
            if (model.length > 0) {
                
                if (price.length > 0) {
                    
                    
                    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,COMPANY_NAME,MODEL,PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','TV')",company.uppercaseString,company.uppercaseString,model.uppercaseString,price.uppercaseString];
        
                    NSLog(@"%@",insertQuery);
                    
                    int result = [[CPDatabaseManager sharedManager]executeQuery:insertQuery];
                    
                    if (result == 1) {
                        NSLog(@"Successfully inserted data");
                        [self showAlertWithTitle:@"OK" message:[NSString stringWithFormat:@"Successfully inserted data"]];

                    }
                    else if (result == 1){
                        NSLog(@"Successfully inserted data");
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Unable to insert data"]];

                        
                    }
                    
                    self.textFieldOne.text = @"";
                    self.textFieldTwo.text = @"";
                    self.textFieldThree.text = @"";
                    
                }
                else {
                    [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                    
                }
            }
            else {
                [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                
            }
        }
        else {
            [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];

        }
        
    }
    
    else if(segmentControl.selectedSegmentIndex == 1) {
        
        
        if (company.length > 0) {
            
            if (model.length > 0) {
                
                if (price.length > 0) {
                    
                    
                    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,COMPANY_NAME,MODEL,PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','MOBILE')",company.uppercaseString,company.uppercaseString,model.uppercaseString,price.uppercaseString];
                    
                    
                    
                    NSLog(@"%@",insertQuery);
                    
                    int result = [[CPDatabaseManager sharedManager]executeQuery:insertQuery];
                    
                    
                    
                    
                    if (result == 1) {
                        NSLog(@"Successfully inserted data");
                        [self showAlertWithTitle:@"OK" message:[NSString stringWithFormat:@"Successfully inserted data"]];

                    }
                   
                    else {
                        NSLog(@"Unable to insert data in SQLite Database");
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Unable to insert data"]];
                    }
                    
                    
                    self.textFieldOne.text = @"";
                    self.textFieldTwo.text = @"";
                    self.textFieldThree.text = @"";
                    
                }
                else {
                    NSLog(@"Enter data First to Save.");
                    [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                    
                }

            }
            else {
                NSLog(@"Enter data First to Save.");
                [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                
            }
        }
        else {
            NSLog(@"Enter data First to Save.");
            [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];

        }

    }
    else if(segmentControl.selectedSegmentIndex == 2) {
        
        
        if (company.length > 0) {
            
            if (model.length > 0) {
                
                if (price.length > 0) {
                    
                    
                    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO DEVICE_TABLE(DEVICE_ID,COMPANY_NAME,MODEL,PRICE,DEVICE_TYPE) VALUES('%@','%@','%@','%@','AC')",company.uppercaseString,company.uppercaseString,model.uppercaseString,price.uppercaseString];
                    
                    
                    
                    NSLog(@"%@",insertQuery);
                    
                    int result = [[CPDatabaseManager sharedManager]executeQuery:insertQuery];
                    NSError *error;
                    
                    
                    
                    if (result == 1) {
                        NSLog(@"Successfully inserted data");
                        [self showAlertWithTitle:@"Ok" message:@"Successfully inserted data"];
                    }
                   
                    else {
                        NSLog(@"Unable to insert data in SQLite Database");
                        [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error.localizedDescription]];

                    }
                    
                    self.textFieldOne.text = @"";
                    self.textFieldTwo.text = @"";
                    self.textFieldThree.text = @"";
                    
                }
                else {
                    NSLog(@"Enter data First to Save.");
                    [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                    
                }
               


            }
            else {
                NSLog(@"Enter data First to Save.");
                [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
                
            }
           
        }
        else {
            NSLog(@"Enter data First to Save.");
            [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
            }
    
        }
        else {
            NSLog(@"Enter data First to Save.");
            [self showAlertWithTitle:@"Error" message:[NSString stringWithFormat:@"Enter data first to save"]];
        
    }


}






-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.textFieldOne) {
        [self.textFieldTwo resignFirstResponder];
        
    }
    else if (textField == self.textFieldTwo) {
        
        [self.textFieldThree resignFirstResponder];
    }
    
    
    return YES;
    
}


    
    
    
    
    
    




- (IBAction)segmentAction:(id)sender {
    
    segmentControl = sender;

    if (segmentControl.selectedSegmentIndex == 0) {
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Model:"];
        
        [self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        
        [self saveTask];
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Model:"];
        
        [self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        [self saveTask];
    }
    else if (segmentControl.selectedSegmentIndex == 2) {
        
        
        
        [self.textFieldOne setPlaceholder:@"Enter Company name:"];
        
        [self.textFieldTwo setPlaceholder:@"Enter Model:"];
        
        [self.textFieldThree setPlaceholder:@"Enter Price:"];
        
        
        [self saveTask];
    }
    
}


- (IBAction)saveAction:(id)sender {
    
    
    [self saveTaskWithSegment];

}


-(void) showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
        
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
