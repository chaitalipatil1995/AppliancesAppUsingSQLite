//
//  CPDatabaseManager.h
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface CPDatabaseManager : NSObject


{
    sqlite3 *myDB;
    NSMutableDictionary * allDeviceDic;
}

+(instancetype) sharedManager;
-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask;
//@property (weak,nonatomic) NSMutableDictionary * allDeviceDic;

-(NSMutableArray *)getAllTaskForTV;

-(NSMutableArray *)getAllTaskForMobile;

-(NSMutableArray *)getAllTaskForAC;



@end
