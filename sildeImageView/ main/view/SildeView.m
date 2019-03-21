//
//  SildeView.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeView.h"
#import "KDCycleBannerView.h"

@interface SildeView() <KDCycleBannerViewDataSource, KDCycleBannerViewDelegate>
@property (nonatomic,strong)KDCycleBannerView *BannerTopView;
@property (nonatomic,strong)KDCycleBannerView *BannerbottomView;

@end


@implementation SildeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}


- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView {
    
    return @[[UIImage imageNamed:@"image1"],
             [UIImage imageNamed:@"image1"],
             [UIImage imageNamed:@"image1"],
             [UIImage imageNamed:@"image1"],
             [UIImage imageNamed:@"image1"]];
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    return UIViewContentModeScaleAspectFill;
}

- (UIImage *)placeHolderImageOfZeroBannerView {
    return [UIImage imageNamed:@"image1"];
}

#pragma mark - KDCycleBannerViewDelegate




- (void)cycleBannerView:(KDCycleBannerView *)bannerView didScrollOffSet:(float)offset{

 
    if(bannerView.tag==1000){
        [self.BannerbottomView setoffsetX:offset];
    }else if(bannerView.tag==1001){
         [self.BannerTopView setoffsetX:offset];
    }
    NSLog(@"didScrollToIndex:%ld", (long)index);
    
}



-(void)createUI{

    self.BannerTopView = [[KDCycleBannerView alloc] init];
    self.BannerTopView.frame = CGRectMake(20, 270, 280, 150);
    self.BannerTopView.datasource = self;
    self.BannerTopView.delegate = self;
    self.BannerTopView.continuous = YES;
    self. BannerTopView.autoPlayTimeInterval = 0;
    [self addSubview:self.BannerTopView];
    self.BannerTopView.tag=1000;
    
    [self setBackgroundColor:[UIColor redColor]];
    
    
    self.BannerbottomView = [[KDCycleBannerView alloc] init];
    self.BannerbottomView.frame = CGRectMake(20, 500, 280, 150);
    self.BannerbottomView.datasource = self;
    self.BannerbottomView.delegate = self;
    self.BannerbottomView.continuous = YES;
    self.BannerbottomView.autoPlayTimeInterval = 0;
     self.BannerbottomView.tag=1001;
    [self addSubview:self.BannerbottomView];
    
    [self setBackgroundColor:[UIColor redColor]];
    
}


@end
