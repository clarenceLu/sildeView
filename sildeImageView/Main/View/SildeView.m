//
//  SildeView.m
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import "SildeView.h"
#import "KDCycleBannerView.h"
#import "HQFlowView.h"
#import "HQImagePageControl.h"
#import <SDWebImage/UIImageView+WebCache.h>



#define JkScreenHeight [UIScreen mainScreen].bounds.size.height
#define JkScreenWidth [UIScreen mainScreen].bounds.size.width

@interface SildeView() <KDCycleBannerViewDataSource, KDCycleBannerViewDelegate,HQFlowViewDelegate,HQFlowViewDataSource>

@property (nonatomic,strong) KDCycleBannerView *BannerTopView;
//@property (nonatomic,strong) KDCycleBannerView *BannerbottomView;
@property (nonatomic, strong) HQFlowView *BannerbottomView;


@end


@implementation SildeView



- (HQFlowView *)BannerbottomView
{
    if (!_BannerbottomView) {
        
        _BannerbottomView = [[HQFlowView alloc] initWithFrame:CGRectMake(0,500, [UIScreen mainScreen].bounds.size.width, 200)];
        _BannerbottomView.delegate = self;
        _BannerbottomView.dataSource = self;
        _BannerbottomView.minimumPageAlpha = 0.3;
        _BannerbottomView.leftRightMargin = 40;
        _BannerbottomView.topBottomMargin = 70;
        _BannerbottomView.orginPageCount = self.imageArray.count;
        _BannerbottomView.isOpenAutoScroll = NO;
        //_BannerbottomView.autoTime = 3.0;
        _BannerbottomView.orientation = HQFlowViewOrientationHorizontal;
        
    }
    return _BannerbottomView;
}



- (CGSize)sizeForPageInFlowView:(HQFlowView *)flowView
{
    return CGSizeMake(JkScreenWidth-300, 100);
}


#pragma mark JQFlowViewDatasource
- (NSInteger)numberOfPagesInFlowView:(HQFlowView *)flowView
{
    return self.imageArray.count;
}
- (HQIndexBannerSubview *)flowView:(HQFlowView *)flowView cellForPageAtIndex:(NSInteger)index
{
    HQIndexBannerSubview *bannerView = (HQIndexBannerSubview *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[HQIndexBannerSubview alloc] initWithFrame:CGRectMake(0, 0, self.BannerbottomView.frame.size.width, self.BannerbottomView.frame.size.height)];
        bannerView.layer.cornerRadius = 5;
        bannerView.layer.masksToBounds = YES;
        bannerView.coverView.backgroundColor = [UIColor darkGrayColor];
    }

    [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[index]] placeholderImage:nil];

    return bannerView;
}


- (void)didScrollViewOffSet:(float)offset{
    
    int num_x =(offset-JkScreenWidth)/75;
    float num_2= num_x*75;
    float num_3 = (offset-JkScreenWidth-num_2)/75;
    float offset_x =  (num_x*JkScreenWidth)+(JkScreenWidth*num_3);
    
    NSLog(@"xxxxxx %f",offset_x);
    
    [self.BannerTopView setoffsetX:offset_x];
    
    
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HQFlowView *)flowView
{

   // [self.BannerTopView setCurrentPage:pageNumber animated:true];
    
    
}
#pragma mark --旋转屏幕改变JQFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        [coordinator animateAlongsideTransition:^(id context) { [self.BannerbottomView reloadData];
        } completion:NULL];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


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
    
    
    NSLog(@"%f",offset);

    int num_x =offset/JkScreenWidth;
    float num_2= num_x*JkScreenWidth;
    float num_3 = (offset-num_2)/JkScreenWidth;
    float offset_x =  (num_3*75)+(75*num_x)+JkScreenWidth;

    [self.BannerbottomView.scrollView setContentOffset:CGPointMake(offset_x, 0)];
}


-(void)createBannerView{
    
    
    self.BannerTopView = [[KDCycleBannerView alloc] init];
    self.BannerTopView.frame = CGRectMake(0, 270, [UIScreen mainScreen].bounds.size.width, 200);
    self.BannerTopView.datasource = self;
    self.BannerTopView.delegate = self;
    self.BannerTopView.continuous = YES;
    self.BannerTopView.autoPlayTimeInterval = 0;
    [self addSubview:self.BannerTopView];
    self.BannerTopView.tag=1000;
    
    
     [self addSubview:self.BannerbottomView];
     [self.BannerbottomView reloadData];
//    self.BannerbottomView = [[KDCycleBannerView alloc] init];
//    self.BannerbottomView.frame = CGRectMake(0, 500, [UIScreen mainScreen].bounds.size.width, 200);
//    self.BannerbottomView.datasource = self;
//    self.BannerbottomView.delegate = self;
//    self.BannerbottomView.continuous = YES;
//    self.BannerbottomView.autoPlayTimeInterval = 0;
//    self.BannerbottomView.tag=1001;
//    [self addSubview:self.BannerbottomView];

    
    
    
}


-(void)createUI{
   
    [self setBackgroundColor:[UIColor whiteColor]];
    
}


@end
