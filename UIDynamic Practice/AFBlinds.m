//
//  AFBlinds.m
//  UIDynamic Practice
//
//  Created by Afiq on 25/05/2016.
//  Copyright © 2016 Afiq. All rights reserved.
//

#import "AFBlinds.h"

@implementation AFBlinds

//@synthesize animator,gravity,collision,itemBehaviour,options,spacingY;

-(id)initWithOptions:(NSArray *)options {
    
    self = [super init];
    
    if (self != nil) {
        _options = options;
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        _spacingY = 60;
        [self setup];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    return self;
}

-(UIView *)createBlind:(NSString*)option {
    
    CGRect screenSize = [UIScreen mainScreen].bounds;
    UIView *blind = [[UIView alloc] initWithFrame:CGRectMake(0, _spacingY, 200, 44)];
    blind.center = CGPointMake(screenSize.size.width/2, blind.center.y);
    blind.layer.borderWidth = 1.0;
    blind.layer.borderColor = [UIColor whiteColor].CGColor;
    
    UILabel *optionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, blind.bounds.size.width, blind.bounds.size.height)];
    optionTitleLabel.text = option;
    optionTitleLabel.textColor = [UIColor whiteColor];
    optionTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    [blind addSubview:optionTitleLabel];
    
    _spacingY += screenSize.size.height / 10;
    
    return blind;
}

-(UIView*)createBarrier:(UIView*)blind {
    
    UIView *barrier = [[UIView alloc] initWithFrame:CGRectMake(blind.frame.origin.x, blind.frame.origin.y - 50 + _spacingY, 200, 2)];
    return barrier;
}

-(void)addCollisionToBlind:(UIView *)blind barrier:(UIView*)barrier {
    _collision = [[UICollisionBehavior alloc] initWithItems:@[blind]];
    [_collision addBoundaryWithIdentifier:@"BlindBarrierBoundary" fromPoint:CGPointMake(barrier.frame.origin.x, barrier.frame.origin.y) toPoint:CGPointMake(barrier.frame.size.width, barrier.frame.origin.y)];
    [_animator addBehavior:_collision];
}

-(void)addGravityToBlind:(UIView *)blind {
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[blind]];
    [_gravity setGravityDirection:CGVectorMake(0, 0.3)];
    
    [_animator addBehavior:_gravity];
}

-(void)addItemBehaviourToBlind:(UIView *)blind {
    _itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[blind]];
    _itemBehaviour.elasticity = 0.5;
    
    [_animator addBehavior:_itemBehaviour];
}


-(void)setup {
    
    int tag = 0;
    
    for (NSString *option in _options) {
        UIView *blind = [self createBlind:option];
        blind.tag = ++tag;
        [self addSubview:blind];
        [self addGravityToBlind:blind];
        
        UIView *barrier = [self createBarrier:blind];
        //barrier.backgroundColor = [UIColor orangeColor];
        [self addSubview:barrier];
        
        [self addCollisionToBlind:blind barrier:barrier];
        [self addItemBehaviourToBlind:blind];
        [self registerGestureRecognizer:blind];
        
        //  NSLog(@"blind x position : %f", blind.frame.origin.x);
        //  NSLog(@"blind y position : %f", blind.frame.origin.y);
        //  NSLog(@"blind tag : %lu", blind.tag);
        
    }
    
}

-(void)registerGestureRecognizer:(UIView *)blind {
    UIGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(blindTapped:)];
    [blind addGestureRecognizer:tapGestureRecognizer];
}

-(void)blindTapped:(UITapGestureRecognizer *)sender {
    if (_blindSelected != nil) {
        _blindSelected(sender.view.tag);
    }
}












@end
