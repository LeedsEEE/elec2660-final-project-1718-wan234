//
//  SearchViewController.m
//  Leftovers
//
//  Created by Wan Bin Wan Ahmad Ifafudin [el16waaw] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SearchViewController.h"
#import "TableViewController.h"

#import "DataRecipes.h"
@interface SearchViewController () <UIPickerViewDelegate, UIPickerViewDataSource>


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Set the borders of the textfeilds
    self.clear.layer.borderWidth=1.0f;
    self.clear.layer.borderColor= [[UIColor blueColor]CGColor];
    self.clear.layer.cornerRadius = 4;
    self.clear.layer.masksToBounds = YES;
    
    self.finder.layer.borderWidth=1.0f;
    self.finder.layer.borderColor= [[UIColor blueColor]CGColor];
    self.finder.layer.cornerRadius = 4;
    self.finder.layer.masksToBounds = YES;
    
    self.ing1.layer.borderWidth=1.0f;
    self.ing1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.ing1.layer.cornerRadius = 4;
    self.ing1.layer.masksToBounds = YES;
    
    self.ing2.layer.borderWidth=1.0f;
    self.ing2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.ing2.layer.cornerRadius = 4;
    self.ing2.layer.masksToBounds = YES;
    
    self.ing3.layer.borderWidth=1.0f;
    self.ing3.layer.borderColor=[[UIColor blackColor]CGColor];
    self.ing3.layer.cornerRadius = 4;
    self.ing3.layer.masksToBounds = YES;
    
    
    
    //Setting the textfield to use pickerview
    self.picker1 = [[UIPickerView alloc]init];
    self.picker1.delegate = self;
    self.picker1.dataSource = self;
    self.picker2 = [[UIPickerView alloc]init];
    self.picker2.delegate = self;
    self.picker2.dataSource = self;
    
    self.picker3 = [[UIPickerView alloc]init];
    self.picker3.delegate = self;
    self.picker3.dataSource = self;
    
    _ing1.inputView = _picker1;
    _ing2.inputView = _picker2;
    _ing3.inputView = _picker3;
    
    _pickerArray = @[@"--Choose ingredients--",@"aubergines",@"brocolli",@"bread",@"bbq sauce", @"chicken", @"cheese",@"curry powder",@"egg",@"ginger",@"milk",@"meat",@"minced meat",@"oyster sauce", @"potatoes",@"pasta",@"soy sauce", @"tomatoes",@"tomato paste",@"wrap"];
    
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark picker view delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;
{
    if (pickerView == _picker1) {
    return _pickerArray[row];
    } else {
        return _pickerArray[row];
    }
}


#pragma mark change text and check for same ingredients
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    //Choosing the object in array and making sure that user would not choose same ingredients
    
    if (_ing1.editing) {
        _ing1.text = _pickerArray[row];
        _ingredient1 = self.ing1.text;
        //It would also send out error if you do not choose any ingredients because all the strings=nil, hence if statements need so it would only check for same ingredients only when ingredients are chosen
        if (_ing2 !=nil){
        [self alertsame];
        }
        if(_ing3 !=nil){
        [self alertsame3];
        }
        }
    else if (_ing2.editing) {
        _ing2.text = _pickerArray[row];
        _ingredient2 = self.ing2.text;
        if(_ing1 != nil){
        [self alertsame];
        }
        if(_ing2 !=nil){
        [self alertsame2];
        }
    }
    else if (_ing3.editing) {
        _ing3.text = _pickerArray[row];
        _ingredient3 = self.ing3.text;
        if(_ing3 != nil){
        [self alertsame2];
        }
        if(_ing1 != nil){
        [self alertsame3];
        }
    }
    
    
    
}

#pragma mark Picker view data source methods

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerArray.count;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

#pragma passing data

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    


    if ([segue.identifier isEqualToString:@"sendtotableview"]) {
        
        TableViewController *tableview = [segue destinationViewController];

        
//Set the array in tableview as an empty one first, then add recipes using if statements
       
        DataRecipes *datarecipe = [[DataRecipes alloc] init];
        self.emptyarray = [NSMutableArray array];
        tableview.showrecipes = self.emptyarray;
 #pragma First ingredient
        //ingredient1
        if ([_ingredient1 isEqualToString: @"bread" ]){
            NSLog(@"ing1 is bread");
            [tableview.showrecipes addObjectsFromArray:datarecipe.breadarray];
        }
        else if ([_ingredient1 isEqualToString:@"aubergines"]) {
            NSLog(@"ing1 is aubergines");
            [tableview.showrecipes addObjectsFromArray:datarecipe.auberginesarray];
        }
        else if ([_ingredient1 isEqualToString:@"butter"]) {
            NSLog(@"ing1 is butter");
            [tableview.showrecipes addObjectsFromArray:datarecipe.butterarray];
        }
        else if ([_ingredient1 isEqualToString:@"brocolli"]) {
            NSLog(@"ing1 is brocolli");
            [tableview.showrecipes addObjectsFromArray:datarecipe.brocolliarray];
        }
        else if ([_ingredient1 isEqualToString:@"bbq sauce"]) {
            NSLog(@"ing1 is bbq sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.bbqsaucerarray];
        }
        else if ([_ingredient1 isEqualToString:@"chicken"]) {
            NSLog(@"ing1 is chicken");
            [tableview.showrecipes addObjectsFromArray:datarecipe.chickenarray];
        }
        else if ([_ingredient1 isEqualToString:@"cheese"]) {
            NSLog(@"ing1 is cheese");
            [tableview.showrecipes addObjectsFromArray:datarecipe.cheesearray];
        }
        else if ([_ingredient1 isEqualToString:@"curry powder"]) {
            NSLog(@"ing1 is curry powder");
            [tableview.showrecipes addObjectsFromArray:datarecipe.curryarray];
        }
        else if ([_ingredient1 isEqualToString:@"egg"]) {
            NSLog(@"ing1 is egg");
            [tableview.showrecipes addObjectsFromArray:datarecipe.eggarray];
        }
        else if ([_ingredient1 isEqualToString:@"ginger"]) {
            NSLog(@"ing1 is ginger");
            [tableview.showrecipes addObjectsFromArray:datarecipe.gingerarray];
        }
        else if ([_ingredient1 isEqualToString:@"milk"]) {
            NSLog(@"ing1 is milk");
            [tableview.showrecipes addObjectsFromArray:datarecipe.milkarray];
        }
        else if ([_ingredient1 isEqualToString:@"meat"]) {
            NSLog(@"ing1 is meat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.meatarray];
        }
        else if ([_ingredient1 isEqualToString:@"minced meat"]) {
            NSLog(@"ing1 is mincedmeat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.mincedmeatarray];
        }
        else if ([_ingredient1 isEqualToString:@"oyster sauce"]) {
            NSLog(@"ing1 is oystersauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.oystersaucearray];
        }
        else if ([_ingredient1 isEqualToString:@"potatoes"]) {
            NSLog(@"ing1 is potaoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.potatoarray];
        }
        else if ([_ingredient1 isEqualToString:@"pasta"]) {
            NSLog(@"ing1 is pasta");
            [tableview.showrecipes addObjectsFromArray:datarecipe.pastaarray];
        }
        else if ([_ingredient1 isEqualToString:@"soy sauce"]) {
            NSLog(@"ing1 is soy sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.soysaucearray];
        }
        else if ([_ingredient1 isEqualToString:@"tomatoes"]) {
            NSLog(@"ing1 is tomatoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatoesarray];
        }
        else if ([_ingredient1 isEqualToString:@"tomato paste"]) {
            NSLog(@"ing1 is tomatopaste");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatopastearray];
        }
        else if ([_ingredient1 isEqualToString:@"wrap"]) {
            NSLog(@"ing1 is wrap");
            [tableview.showrecipes addObjectsFromArray:datarecipe.wraparray];
        }
         #pragma Second ingredient
        //ingredient2
        if ([_ingredient2 isEqualToString: @"bread" ]){
            NSLog(@"ing2 is bread");
            [tableview.showrecipes addObjectsFromArray:datarecipe.breadarray];
        }
        else if ([_ingredient2 isEqualToString:@"aubergines"]) {
            NSLog(@"ing2 is aubergines");
            [tableview.showrecipes addObjectsFromArray:datarecipe.auberginesarray];
        }
        else if ([_ingredient2 isEqualToString:@"butter"]) {
            NSLog(@"ing2 is butter");
            [tableview.showrecipes addObjectsFromArray:datarecipe.butterarray];
        }
        else if ([_ingredient2 isEqualToString:@"brocolli"]) {
            NSLog(@"ing2 is brocolli");
            [tableview.showrecipes addObjectsFromArray:datarecipe.brocolliarray];
        }
        else if ([_ingredient2 isEqualToString:@"bbq sauce"]) {
            NSLog(@"ing2 is bbq sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.bbqsaucerarray];
        }
        else if ([_ingredient2 isEqualToString:@"chicken"]) {
            NSLog(@"ing2 is chicken");
            [tableview.showrecipes addObjectsFromArray:datarecipe.chickenarray];
        }
        else if ([_ingredient2 isEqualToString:@"cheese"]) {
            NSLog(@"ing2 is cheese");
            [tableview.showrecipes addObjectsFromArray:datarecipe.cheesearray];
        }
        else if ([_ingredient2 isEqualToString:@"curry powder"]) {
            NSLog(@"ing2 is curry powder");
            [tableview.showrecipes addObjectsFromArray:datarecipe.curryarray];
        }
        else if ([_ingredient2 isEqualToString:@"egg"]) {
            NSLog(@"ing2 is egg");
            [tableview.showrecipes addObjectsFromArray:datarecipe.eggarray];
        }
        else if ([_ingredient2 isEqualToString:@"ginger"]) {
            NSLog(@"ing2 is ginger");
            [tableview.showrecipes addObjectsFromArray:datarecipe.gingerarray];
        }
        else if ([_ingredient2 isEqualToString:@"milk"]) {
            NSLog(@"ing2 is milk");
            [tableview.showrecipes addObjectsFromArray:datarecipe.milkarray];
        }
        else if ([_ingredient2 isEqualToString:@"meat"]) {
            NSLog(@"ing2 is meat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.meatarray];
        }
        else if ([_ingredient2 isEqualToString:@"minced meat"]) {
            NSLog(@"ing2 is mincedmeat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.mincedmeatarray];
        }
        else if ([_ingredient2 isEqualToString:@"oyster sauce"]) {
            NSLog(@"ing2 is oystersauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.oystersaucearray];
        }
        else if ([_ingredient2 isEqualToString:@"potatoes"]) {
            NSLog(@"ing2 is potaoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.potatoarray];
        }
        else if ([_ingredient2 isEqualToString:@"pasta"]) {
            NSLog(@"ing2 is pasta");
            [tableview.showrecipes addObjectsFromArray:datarecipe.pastaarray];
        }
        else if ([_ingredient2 isEqualToString:@"soy sauce"]) {
            NSLog(@"ing2 is soy sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.soysaucearray];
        }
        else if ([_ingredient2 isEqualToString:@"tomatoes"]) {
            NSLog(@"ing2 is tomatoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatoesarray];
        }
        else if ([_ingredient2 isEqualToString:@"tomato paste"]) {
            NSLog(@"ing2 is tomatopaste");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatopastearray];
        }
        else if ([_ingredient2 isEqualToString:@"wrap"]) {
            NSLog(@"ing2 is wrap");
            [tableview.showrecipes addObjectsFromArray:datarecipe.wraparray];
        }
        
         #pragma Third ingredient
        //ingredient3
        if ([_ingredient3 isEqualToString: @"bread" ]){
            NSLog(@"ing3 is bread");
            [tableview.showrecipes addObjectsFromArray:datarecipe.breadarray];
        }
        else if ([_ingredient2 isEqualToString:@"aubergines"]) {
            NSLog(@"ing2 is aubergines");
            [tableview.showrecipes addObjectsFromArray:datarecipe.auberginesarray];
        }
        else if ([_ingredient3 isEqualToString:@"butter"]) {
            NSLog(@"ing3 is butter");
            [tableview.showrecipes addObjectsFromArray:datarecipe.butterarray];
        }
        else if ([_ingredient3 isEqualToString:@"brocolli"]) {
            NSLog(@"ing3 is brocolli");
            [tableview.showrecipes addObjectsFromArray:datarecipe.brocolliarray];
        }
        else if ([_ingredient3 isEqualToString:@"bbq sauce"]) {
            NSLog(@"ing3 is bbq sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.bbqsaucerarray];
        }
        else if ([_ingredient3 isEqualToString:@"chicken"]) {
            NSLog(@"ing3 is chicken");
            [tableview.showrecipes addObjectsFromArray:datarecipe.chickenarray];
        }
        else if ([_ingredient3 isEqualToString:@"cheese"]) {
            NSLog(@"ing3 is cheese");
            [tableview.showrecipes addObjectsFromArray:datarecipe.cheesearray];
        }
        else if ([_ingredient3 isEqualToString:@"curry powder"]) {
            NSLog(@"ing3 is curry powder");
            [tableview.showrecipes addObjectsFromArray:datarecipe.curryarray];
        }
        else if ([_ingredient3 isEqualToString:@"egg"]) {
            NSLog(@"ing3 is egg");
            [tableview.showrecipes addObjectsFromArray:datarecipe.eggarray];
        }
        else if ([_ingredient3 isEqualToString:@"ginger"]) {
            NSLog(@"ing3 is ginger");
            [tableview.showrecipes addObjectsFromArray:datarecipe.gingerarray];
        }
        else if ([_ingredient3 isEqualToString:@"milk"]) {
            NSLog(@"ing3 is milk");
            [tableview.showrecipes addObjectsFromArray:datarecipe.milkarray];
        }
        else if ([_ingredient3 isEqualToString:@"meat"]) {
            NSLog(@"ing3 is meat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.meatarray];
        }
        else if ([_ingredient3 isEqualToString:@"minced meat"]) {
            NSLog(@"ing3 is mincedmeat");
            [tableview.showrecipes addObjectsFromArray:datarecipe.mincedmeatarray];
        }
        else if ([_ingredient3 isEqualToString:@"oyster sauce"]) {
            NSLog(@"ing3 is oystersauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.oystersaucearray];
        }
        else if ([_ingredient3 isEqualToString:@"potatoes"]) {
            NSLog(@"ing3 is potaoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.potatoarray];
        }
        else if ([_ingredient3 isEqualToString:@"pasta"]) {
            NSLog(@"ing3 is pasta");
            [tableview.showrecipes addObjectsFromArray:datarecipe.pastaarray];
        }
        else if ([_ingredient3 isEqualToString:@"soy sauce"]) {
            NSLog(@"ing3 is soy sauce");
            [tableview.showrecipes addObjectsFromArray:datarecipe.soysaucearray];
        }
        else if ([_ingredient3 isEqualToString:@"tomatoes"]) {
            NSLog(@"ing3 is tomatoes");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatoesarray];
        }
        else if ([_ingredient3 isEqualToString:@"tomato paste"]) {
            NSLog(@"ing3 is tomatopaste");
            [tableview.showrecipes addObjectsFromArray:datarecipe.tomatopastearray];
        }
        else if ([_ingredient3 isEqualToString:@"wrap"]) {
            NSLog(@"ing3 is wrap");
            [tableview.showrecipes addObjectsFromArray:datarecipe.wraparray];
        }
              
        }
    
}


#pragma alert if same ingredients betweeen ing1 and ing2
//method to make sure user would not choose same ingredients
-(void) alertsame {
    if ([_ingredient1 isEqualToString: _ingredient2 ]) {
        NSLog(@"same ingredients");
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"You have chosen the same ingredients!" message:@"Please choose a different ingredient" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okayAction = [UIAlertAction
                                     actionWithTitle:@"okay"
                                     style:UIAlertActionStyleCancel
                                     handler:^(UIAlertAction *action) {
                                         self.ing2.text = nil;
                                         _ingredient2 = nil;
                                     }];
        [alertcontroller addAction:okayAction];
        [self presentViewController:alertcontroller animated:YES completion:nil];
        
    }
}
   #pragma alert if same ingredients between ing2 and ing3
    -(void) alertsame2 {
 if ([_ingredient2 isEqualToString: _ingredient3 ]) {
        NSLog(@"same ingredients");
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"You have chosen the same ingredients!" message:@"Please choose a different ingredient" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okayAction = [UIAlertAction
                                     actionWithTitle:@"okay"
                                     style:UIAlertActionStyleCancel
                                     handler:^(UIAlertAction *action) {
                                         self.ing3.text = nil;
                                         _ingredient3 = nil;
                                     }];
        [alertcontroller addAction:okayAction];
        [self presentViewController:alertcontroller animated:YES completion:nil];
        
    }
    }
#pragma alert if same ingredients for ing1 and ing3
-(void) alertsame3 {
     if ([_ingredient1 isEqualToString: _ingredient3 ]) {
        NSLog(@"same ingredients");
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"You have chosen the same ingredients!" message:@"Please choose a different ingredient" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okayAction = [UIAlertAction
                                     actionWithTitle:@"okay"
                                     style:UIAlertActionStyleCancel
                                     handler:^(UIAlertAction *action) {
                                         self.ing3.text = nil;
                                         _ingredient3 = nil;
                                     }];
        [alertcontroller addAction:okayAction];
        [self presentViewController:alertcontroller animated:YES completion:nil];
        
    }
    
}
//method to clear all ingredients
-(void) clearalltext {
    self.ing1.text = nil;
    self.ing2.text = nil;
    self.ing3.text = nil;
    NSLog(@"Clear text");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)Next:(id)sender {
}


//Clear textfield
- (IBAction)Clearing:(id)sender {
    [self clearalltext];

}

- (IBAction)Findrecipe:(id)sender {
    
   

    
}
//Set the empty strings as ingredients chosen
//The picker view would go away once background pressed
- (IBAction)backgroundPressed:(id)sender {
    
    NSLog(@"Background pressed.");
    
    if ([self.ing1 isFirstResponder]) {
        [self.ing1 resignFirstResponder];
    }
    _ingredient1 = self.ing1.text;
    
    
    if ([self.ing2 isFirstResponder]) {
        [self.ing2 resignFirstResponder];
    }
    _ingredient2 = self.ing2.text;
    if ([self.ing3 isFirstResponder]) {
        [self.ing3 resignFirstResponder];
    }
    _ingredient3 = self.ing3.text;

 
   
    
}
@end
