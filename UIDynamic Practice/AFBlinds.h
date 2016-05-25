//
//  AFBlinds.h
//  UIDynamic Practice
//
//  Created by Afiq on 25/05/2016.
//  Copyright © 2016 Afiq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFBlinds : UIView

@property UIDynamicAnimator *animator;
@property UIGravityBehavior *gravity;
@property UICollisionBehavior *collision;
@property UIDynamicItemBehavior *itemBehaviour;
@property (nonatomic, copy) void (^blindSelected)(NSInteger x);
@property NSArray *options;
@property CGFloat spacingY;
-(id)initWithOptions:(NSArray *)options;

@end
