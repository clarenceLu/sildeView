//
//  NetWorkManage.h
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManage : NSObject
@property (nonatomic,strong) AFHTTPSessionManager* AFhttpSessionManager;

+ (instancetype)sharedManager;

- (void)GET:(NSString*)url parameters:(NSDictionary*)param success:(SuccessBlock)success failure:(FailureBlock)failure;

- (void)POST:(NSString*)url parameters:(NSDictionary*)param success:(SuccessBlock)success failure:(FailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
