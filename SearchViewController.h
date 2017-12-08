//
//  SearchViewController.h
//  Leftovers
//
//  Created by Wan Bin Wan Ahmad Ifafudin [el16waaw] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRecipes.h"

@interface SearchViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//@property (nonatomic, retain) NSString *data;

@property (strong, nonatomic) IBOutlet UITextField *ing1;
@property (strong, nonatomic) UIPickerView *picker1;

@property (strong, nonatomic) IBOutlet UITextField *ing2;
@property (strong, nonatomic) UIPickerView *picker2;

@property (weak, nonatomic) IBOutlet UITextField *ing3;
@property (strong, nonatomic) UIPickerView *picker3;

@property (weak, nonatomic) IBOutlet UIButton *clear;
@property (weak, nonatomic) IBOutlet UIButton *finder;

@property (strong,nonatomic) NSString *ingredient1;
@property (strong,nonatomic) NSString *ingredient2;
@property (strong,nonatomic) NSString *ingredient3;
@property (strong, nonatomic) NSMutableArray *emptyarray;



- (IBAction)Clearing:(id)sender;

- (IBAction)Findrecipe:(id)sender;

- (IBAction)backgroundPressed:(id)sender;
@property (strong, nonatomic) NSArray *pickerArray;
@end
