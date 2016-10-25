//
//  CPDatabaseManager.m
//  CPAppliancesAppUsingSqlite
//
//  Created by Student P_07 on 12/10/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "CPDatabaseManager.h"

@implementation CPDatabaseManager

+(instancetype)sharedManager {
    
    static CPDatabaseManager *sharedInstance;
    
    if (sharedInstance == nil) {
        sharedInstance = [[CPDatabaseManager alloc]init];
    }
    
    return sharedInstance;
}

-(NSString *)getDatabasePath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/SqLDatabase.sqlite"];
}


-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    sqlite3_stmt *statement;
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                success = 1;
            }
        }
        sqlite3_close(myDB);
    }
    return success;
}

//-(NSMutableArray *)getAllTask {
//    
//    NSMutableArray *allDeviceArray = [[NSMutableArray alloc]init];
//    sqlite3_stmt *statement;
//    
//    NSString *query = @"SELECT * FROM DEVICE_TABLE";
//    
//    const char *UTFquery = [query UTF8String];
//    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
//    
//    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
//        
//        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
//            
//            while (sqlite3_step(statement) == SQLITE_ROW) {
//                
//                const char * deviceString = (const char *)sqlite3_column_text(statement, 0);
//                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
//                const char * modelString = (const char *)sqlite3_column_text(statement, 2);
//                const char * priceString = (const char *)sqlite3_column_text(statement, 3);
//                const char * deviceTypeString = (const char *)sqlite3_column_text(statement, 4);
//                
//                NSString *device_id = [NSString stringWithUTF8String:deviceString];
//                
//                NSString *company = [NSString stringWithUTF8String:companyString];
//                NSString *model = [NSString stringWithUTF8String:modelString];
//                NSString *price = [NSString stringWithUTF8String:priceString];
//                NSString *deviceType = [NSString stringWithUTF8String:deviceTypeString];
//                
//              allDeviceDic = [[NSMutableDictionary alloc]initWithObjects:@[device_id,company,model,price,deviceType] forKeys:@[@"device_id",@"company",@"model",@"price",@"deviceType"]];
//                
//                
//                [allDeviceArray addObject:allDeviceDic];
//                
//                
//                
//            }
//        }
//        
//        sqlite3_close(myDB);
//    }
//    
//    return allDeviceArray;
//    
//}



-(NSMutableArray *)getAllTaskForTV {
    
    NSMutableArray *TVArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'TV'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * deviceString = (const char *)sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
                const char * modelString = (const char *)sqlite3_column_text(statement, 2);
                const char * priceString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceTypeString = (const char *)sqlite3_column_text(statement, 4);

                NSString *device_id = [NSString stringWithUTF8String:deviceString];

                NSString *company = [NSString stringWithUTF8String:companyString];
                NSString *model = [NSString stringWithUTF8String:modelString];
                NSString *price = [NSString stringWithUTF8String:priceString];
                NSString *deviceType = [NSString stringWithUTF8String:deviceTypeString];

                NSDictionary *tvDic = [[NSDictionary alloc]initWithObjects:@[device_id,company,model,price,deviceType] forKeys:@[@"tv_id",@"company",@"model",@"price",@"TV"]];
                
            
                [TVArray addObject:tvDic];

                
                
                }
            }
        
        sqlite3_close(myDB);
    }
    
    return TVArray;
    
}

-(NSMutableArray *)getAllTaskForMobile {
    
    NSMutableArray *MobileArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'MOBILE'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * deviceString = (const char *)sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
                const char * modelString = (const char *)sqlite3_column_text(statement, 2);
                const char * priceString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceTypeString = (const char *)sqlite3_column_text(statement, 4);
                
                NSString *device_id = [NSString stringWithUTF8String:deviceString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                NSString *model = [NSString stringWithUTF8String:modelString];
                NSString *price = [NSString stringWithUTF8String:priceString];
                NSString *deviceType = [NSString stringWithUTF8String:deviceTypeString];

                NSDictionary *mobileDic = [[NSDictionary alloc]initWithObjects:@[device_id,company,model,price,deviceType] forKeys:@[@"mobile_id",@"company",@"model",@"price",@"MOBILE"]];
                
                
                [MobileArray addObject:mobileDic];
                
                
                
            }
        }
        
        sqlite3_close(myDB);
    }
    
    return MobileArray;
    
}

-(NSMutableArray *)getAllTaskForAC {
    
    NSMutableArray *ACArray = [[NSMutableArray alloc]init];
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT * FROM DEVICE_TABLE WHERE DEVICE_TYPE = 'AC'";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath] UTF8String];
    
    if (sqlite3_open(UTFDatabasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, nil) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char * deviceString = (const char *)sqlite3_column_text(statement, 0);
                const char * companyString = (const char *)sqlite3_column_text(statement, 1);
                const char * modelString = (const char *)sqlite3_column_text(statement, 2);
                const char * priceString = (const char *)sqlite3_column_text(statement, 3);
                const char * deviceTypeString = (const char *)sqlite3_column_text(statement, 4);


                NSString *device_id = [NSString stringWithUTF8String:deviceString];
                
                NSString *company = [NSString stringWithUTF8String:companyString];
                NSString *model = [NSString stringWithUTF8String:modelString];
                NSString *price = [NSString stringWithUTF8String:priceString];
                NSString *deviceType = [NSString stringWithUTF8String:deviceTypeString];

                NSDictionary *acDic = [[NSDictionary alloc]initWithObjects:@[device_id,company,model,price,deviceType] forKeys:@[@"AC_id",@"company",@"model",@"price",@"AC"]];
                
                
                [ACArray addObject:acDic];
                
            }
        }
        
        sqlite3_close(myDB);
    }

    return ACArray;

}






@end
