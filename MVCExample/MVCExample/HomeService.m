//
//  HomeService.m
//  MVCExample
//
//  Created by dulingkang on 16/3/19.
//  Copyright © 2016年 com.shawn. All rights reserved.
//

#import "HomeService.h"

@interface HomeService ()

@property (nonatomic, readwrite, strong) NSMutableArray *dataSource;

@end


@implementation HomeService

- (instancetype)init
{
    if (self = [super init]) {
        _dataSource = [NSMutableArray new];
    }
    
    return self;
}

- (void)fetchDataFromServiceWithCompletion:(void(^)(BOOL success, NSError *error))completion
{
    /*
    afnetwork *manager = [afnetworking new];
    [manager postwithParameters:param withUrl:url successblock:{
        if(retcode == 200) {
     
     }
     } failureblock:{
     
     }];
     
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_dataSource addObject:@"test"];
        completion(YES, nil);
    });
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"网络错误"};
        NSError *error = [[NSError alloc] initWithDomain:@"domain.homeservice" code:404 userInfo:userInfo];
        completion(NO, error);
    });
    
}

@end
