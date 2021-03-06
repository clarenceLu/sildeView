//
//  SildeView.h
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SildeView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

-(void)createUI;

-(void)createBannerView;


@property (nonatomic,strong)NSMutableArray *videoArray;
@property (nonatomic,strong)NSMutableArray *imageArray;



@end

NS_ASSUME_NONNULL_END
