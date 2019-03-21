//
//  sildeViewController.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeViewController.h"
#import "SildeViewModel.h"
#import "SildeViewService.h"

@interface SildeViewController ()

@property(nonatomic, strong) SildeViewModel *sildeViewModel;

@end

@implementation SildeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sildeViewModel = [[SildeViewModel alloc] init];
    [self requestData];
    [self addSildeView];
}


-(void)addSildeView{
    
    [self.view addSubview:self.sildeViewModel.sildeView];
}


-(void)requestData{
  
    [SildeViewService requestDataWithSource:self.sildeViewModel.sildeModel result:^(BOOL success, id  _Nonnull result, NSString * _Nonnull msg) {
        if(success==true){
            NSLog(@"%@",result);
            NSLog(@"%@",self.sildeViewModel.sildeModel);
        }
    }];
}


@end
