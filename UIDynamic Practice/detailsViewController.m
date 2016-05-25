//
//  DetailsViewController.m
//  UIDynamic Practice
//
//  Created by Afiq on 25/05/2016.
//  Copyright © 2016 Afiq. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *description = [NSString stringWithFormat:@"Welcome Home %@", _name];
    
    _descriptionLabel.text = description;
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
