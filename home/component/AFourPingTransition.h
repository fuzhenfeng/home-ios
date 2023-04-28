//
//  LRFourPingTransition.h
//  控制器专场动画集合
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 lurong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, APresentOneTransitionType) {
    PresentOneTransitionTypePresent = 0,//管理present动画
    PresentOneTransitionTypeDismiss//管理dismiss动画
};

@interface AFourPingTransition : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

@property (nonatomic,assign) APresentOneTransitionType type;

+ (instancetype)transitionWithTransitionType:(APresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(APresentOneTransitionType)type;

@end
