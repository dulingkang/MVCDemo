//
//  HomeViewController.m
//  MVCExample
//
//  Created by dulingkang on 16/3/19.
//  Copyright © 2016年 com.shawn. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeService.h"
#import "HomeDisplayView.h"


@interface HomeViewController ()

@property (strong, nonatomic) HomeService *homeService;

@property (strong, nonatomic) HomeDisplayView *displayView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    
    [self fetchDataFromService];
}

- (void)initView
{
    self.displayView = [HomeDisplayView new];
    [self.view addSubview:self.displayView];
}


- (void)fetchDataFromService
{
    __weak typeof(self)weakSelf = self;
    [self.homeService fetchDataFromServiceWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"%@", weakSelf.homeService.dataSource);
            [weakSelf.displayView updateViewWithData:weakSelf.homeService.dataSource];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.localizedDescription message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

- (HomeService *)homeService
{
    if (!_homeService) {
        _homeService = [HomeService new];
    }
    
    return _homeService;
}

@end
