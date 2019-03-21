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
        self.imageArray = [[NSMutableArray alloc] initWithCapacity:50];
        self.videoArray = [[NSMutableArray alloc] initWithCapacity:50];
        [self createUI];
    }
    return self;
}


- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView {
    
    if(bannerView.tag==1000){
        return self.videoArray;
    }else if(bannerView.tag==1001){
        return self.imageArray;
    }
    return nil;
    
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


-(void)createBannerView{
    
    
    self.BannerTopView = [[KDCycleBannerView alloc] init];
    self.BannerTopView.frame = CGRectMake(0, 270, [UIScreen mainScreen].bounds.size.width, 200);
    self.BannerTopView.datasource = self;
    self.BannerTopView.delegate = self;
    self.BannerTopView.continuous = YES;
    self. BannerTopView.autoPlayTimeInterval = 0;
    [self addSubview:self.BannerTopView];
    self.BannerTopView.tag=1000;
    
    [self setBackgroundColor:[UIColor redColor]];
    
    
    self.BannerbottomView = [[KDCycleBannerView alloc] init];
    self.BannerbottomView.frame = CGRectMake(0, 500, [UIScreen mainScreen].bounds.size.width, 200);
    self.BannerbottomView.datasource = self;
    self.BannerbottomView.delegate = self;
    self.BannerbottomView.continuous = YES;
    self.BannerbottomView.autoPlayTimeInterval = 0;
    self.BannerbottomView.tag=1001;
    [self addSubview:self.BannerbottomView];

}


-(void)createUI{
   
    [self setBackgroundColor:[UIColor whiteColor]];
    
}


@end
