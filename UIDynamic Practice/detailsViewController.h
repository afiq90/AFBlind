//
//  DetailsViewController.h
//  UIDynamic Practice
//
//  Created by Afiq on 25/05/2016.
//  Copyright © 2016 Afiq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) NSString *name;
@end
