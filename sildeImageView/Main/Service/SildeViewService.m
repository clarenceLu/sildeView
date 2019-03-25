//
//  SildeViewService.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeViewService.h"
#import "SourceModel.h"
#import <MJExtension/MJExtension.h>

@implementation SildeViewService


+(void)requestDataWithSource:(SildeModel*)sildeModel result:(sildeServiceBlock)success{
    
    [[NetWorkManage sharedManager] GET:@"http://private-04a55-videoplayer1.apiary-mock.com/pictures"
                            parameters:nil
                               success:^(id responseObject) {
                                   NSArray *response = [[NSArray alloc] initWithArray:responseObject];
                                   for (NSDictionary *source in response){
                                       SourceModel *model = [SourceModel mj_objectWithKeyValues:source];
                                       [sildeModel.sildeArray addObject:model];
                                   }
                                    success(true,response,@"");
                               } failure:^(NSError *error) {
                                    success(false,nil,@"");
                               } ];
}

@end
