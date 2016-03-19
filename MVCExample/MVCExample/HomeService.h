//
//  HomeService.h
//  MVCExample
//
//  Created by dulingkang on 16/3/19.
//  Copyright © 2016年 com.shawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeService : NSObject

@property (nonatomic, readonly, strong) NSMutableArray *dataSource;

- (void)fetchDataFromServiceWithCompletion:(void(^)(BOOL success, NSError *error))completion;

@end
