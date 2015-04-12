//
//  ViewController.h
//  Hartsock_P_2.5
//
//  Created by Ryan  7/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)rollDice:(id)sender;
- (IBAction)sliderMoved:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *winsOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lossesOutlet;
@property (weak, nonatomic) IBOutlet UILabel *netOutlet;
@property (weak, nonatomic) IBOutlet UILabel *sumOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;
@property (weak, nonatomic) IBOutlet UILabel *betOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIButton *die_1;
@property (weak, nonatomic) IBOutlet UIButton *die_2;
@end
