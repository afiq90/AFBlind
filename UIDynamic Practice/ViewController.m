//
//  ViewController.m
//  UIDynamic Practice
//
//  Created by Afiq on 25/05/2016.
//  Copyright © 2016 Afiq. All rights reserved.
//

#import "ViewController.h"
#import "AFBlinds.h"
#import "DetailsViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setup];
}

-(void)setup {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 20, self.view.frame.size.width, 22)];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.center = CGPointMake(self.view.center.x, _label.frame.origin.y);
    
    [self.view addSubview:_label];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    //    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(restart:)];
    //    [self.view addGestureRecognizer:tapGestureRecognizer];
    [self showBlinds];
}

-(void)restart:(UITapGestureRecognizer*)recognizer {
    [self showBlinds];
}


-(void)showBlinds {
    // remove the blind if already inserted
    [[self.view viewWithTag:100] removeFromSuperview];
    
    NSArray *optionsArray = @[@"aisya umairah",@"aisya sofea",@"what a lovely kids",@"kambing"];
    AFBlinds *afBlind = [[AFBlinds alloc] initWithOptions:optionsArray];
    afBlind.tag = 100;
    afBlind.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    afBlind.blindSelected = ^void(NSInteger x) {
        _label.text = [NSString stringWithFormat:@"%ld", (long)x];
        NSLog(@"you selected index : %ld", (long)x);
        
        if (x == 1) {
            
            [self presentModally:0 optionsArray:optionsArray];
            
        } else if (x == 2) {
            [self presentModally:1 optionsArray:optionsArray];
            NSLog(@"kaguya");
        } else if (x == 3) {
            [self presentModally:2 optionsArray:optionsArray];
            NSLog(@"ashura");
        } else if (x == 4) {
            [self presentModally:3 optionsArray:optionsArray];
            NSLog(@"hagomore");
        }
    };
    [self.view addSubview:afBlind];
}

- (void)presentModally:(int)intValue optionsArray:(NSArray *)optionsArray{
    //Present modally technique - need to remove navigation controller from ViewController
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *detailsVC = [sb instantiateViewControllerWithIdentifier:@"detailsVC"];
    detailsVC.name = optionsArray[intValue];
    [self presentViewController:detailsVC animated:YES completion:nil];
    
    //Push controller technique - add navigation controller to ViewController using Editor -> Embed In
    //            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //            DetailsViewController *detailsVC = [sb instantiateViewControllerWithIdentifier:@"detailsVC"];
    //            [self.navigationController pushViewController:detailsVC animated:YES];
    //            NSLog(@"goku");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
