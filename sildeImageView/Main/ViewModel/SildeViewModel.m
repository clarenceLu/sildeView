//
//  SildeViewModel.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeViewModel.h"
#import "SourceModel.h"

@implementation SildeViewModel


-(instancetype)init
{
    if (self = [super init]) {
        self.sildeModel = [[SildeModel alloc] init];
    }
    return self;
}


-(void)updateSlideData{
    for (SourceModel *data in self.sildeModel.sildeArray){
        [_sildeView.videoArray addObject:data.videoUrl];
        [_sildeView.imageArray addObject:data.imageUrl];
    }
    
    [_sildeView createBannerView];
}


-(SildeView *)sildeView
{
    if (!_sildeView) {
        _sildeView = [[SildeView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    }
    return _sildeView;
}

@end
