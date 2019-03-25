//
//  SildeViewModel.h
//  sildeImageView
//
//  Created by lujiawei on 2019/3/21.
//  Copyright © 2019 clarence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SildeView.h"
#import "SildeModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface SildeViewModel : NSObject

@property(nonatomic, strong) SildeModel *sildeModel;

@property(nonatomic, strong) SildeView *sildeView;


-(void)updateSlideData;


@end

NS_ASSUME_NONNULL_END
