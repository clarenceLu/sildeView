//
//  NetWorkManage.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "NetWorkManage.h"

@implementation NetWorkManage

+ (instancetype)sharedManager {
    static NetWorkManage *manager = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        manager = [[NetWorkManage alloc] init];
        manager.AFhttpSessionManager = [AFHTTPSessionManager manager];
        manager.AFhttpSessionManager.requestSerializer=[AFJSONRequestSerializer serializer];
        manager.AFhttpSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        NSMutableSet *set = [[NSMutableSet alloc] initWithSet:manager.AFhttpSessionManager.responseSerializer.acceptableContentTypes];
        [set addObject:@"text/html"];
        [set addObject:@"text/plain"];
        [set addObject:@"text/javascript"];
        [set addObject:@"text/json"];
        [set addObject:@"application/json"];
        [set addObject:@"application/x-javascript"];
        [set addObject:@"image/png"];
        [set addObject:@"charset=utf-8"];
        [set addObject:@"application/xml"];
        [set addObject:@"text/xml"];
        manager.AFhttpSessionManager.responseSerializer.acceptableContentTypes = set;
    });
    return manager;
}

- (void)GET:(NSString*)url parameters:(NSDictionary*)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    NSString *urlstr = url;
    [_AFhttpSessionManager GET:urlstr parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)POST:(NSString*)url parameters:(NSDictionary*)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    NSString *urlstr = url;
    [_AFhttpSessionManager POST:urlstr parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}




@end
