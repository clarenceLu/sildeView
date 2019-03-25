//
//  SildeViewService.h
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManage.h"
#import "SildeModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^sildeServiceBlock) (BOOL success,id result,NSString *msg);

@interface SildeViewService : NSObject

+(void)requestDataWithSource:(SildeModel*)sildeModel result:(sildeServiceBlock)success;


@end

NS_ASSUME_NONNULL_END
