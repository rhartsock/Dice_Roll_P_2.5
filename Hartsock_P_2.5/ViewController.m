//
//  ViewController.m
//  Hartsock_P_2.5
//
//  Created by Ryan on 7/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *files;
@property int bet, win;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.files = @[@"", @"dice1.png", @"dice2.png", @"dice3.png", @"dice4.png", @"dice5.png", @"dice6.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) calculateWins: (int) dice_1 and:(int)dice_2{
    
    int total = dice_1 + dice_2;
    
    int wins = 0;
    int losses = 0;
    int val = 0;
    
    //Calculate value losses
    if (total > 6) {
        losses = losses+self.bet;
        NSLog(@">6 loss");
    }
    else if (total <= 6){
        losses = losses+(2 * self.bet);
        NSLog(@"<=6 loss");
    }
    
    //Calculate even/odd wins(on ==> even off ==>o dd)
    if ((total%2 == 0 && self.switchOutlet.isOn) || (total%2 == 1 && !self.switchOutlet.isOn)) {
        wins = wins+self.bet;
        NSLog(@"even/odd win");
    }
    
    if (dice_1 >= 5 || dice_2 >= 5) {
        wins += 2*self.bet;
        NSLog(@">5 win");
    }
    
    if (dice_1 == dice_2) {
        
        if (dice_1 == 6 && dice_2 == 6) {
            wins += 5*self.bet;
            NSLog(@"6 = face win");
        }
        else{
            wins += 3*self.bet;
            NSLog(@"= face win");
        }
    }
    
    
    
    val = wins - losses;
    
    self.winsOutlet.text = [NSString stringWithFormat:@"%i",wins];
    self.lossesOutlet.text = [NSString stringWithFormat:@"%i",losses];
    self.netOutlet.text = [NSString stringWithFormat:@"%i",val];
    
    
}

- (IBAction)rollDice:(id)sender {
    int die_1 = arc4random() %6 + 1;
    int die_2 = arc4random() %6 + 1;
    int sum = die_1 + die_2;
    UIImage *img_1 = [UIImage imageNamed: self.files[die_1]];
    UIImage *img_2 = [UIImage imageNamed: self.files[die_2]];
    
    [self.die_1 setBackgroundImage:img_1 forState:UIControlStateNormal];
    [self.die_2 setBackgroundImage:img_2 forState:UIControlStateNormal];
    
    self.bet = self.sliderOutlet.value;
    
    self.sumOutlet.text = [NSString stringWithFormat:@"%i",sum];
    
    [self calculateWins:die_1 and:die_2];
    NSLog(@"------------");
    
}

- (IBAction)sliderMoved:(id)sender {
    self.betOutlet.text = [NSString stringWithFormat:@"%.0f",self.sliderOutlet.value];
    
}



@end
