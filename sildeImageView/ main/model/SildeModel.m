//
//  SildeModel.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeModel.h"

@implementation SildeModel


-(instancetype)init
{
    if (self = [super init]) {
        self.sildeArray = [[NSMutableArray alloc] initWithCapacity:50];
    }
    return self;
}

@end
