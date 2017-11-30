//
//  DataRecipes.m
//  Leftovers
//
//  Created by Wan Bin Wan Ahmad Ifafudin [el16waaw] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataRecipes.h"
#import "SearchviewController.h"

@implementation DataRecipes




NSString *egg = @"egg";
NSString *oil = @"oil";
NSString *bread = @"bread";
NSString *cheese = @"cheese";
NSString *butter = @"butter";


- (instancetype)init
{
    SearchViewController *ViewControl = [[SearchViewController alloc] init];
    _theData = ViewControl.ingredient1;
    
    self = [super init];
    
    if (self) {
        
       
        //self.theData = [[SearchViewController alloc] init];
        
        self.TheRecipes = [NSMutableArray array];
        Recipes *Omlette = [[Recipes alloc] init];
        Omlette.foodname = @"Omlette";
        Omlette.Description = @" simple egg dish";
        Omlette.ingredients = [NSString stringWithFormat:@"Ingredients: %@ %@",egg,oil];
        Omlette.steps = @"1.Heat the pan and pour oil. \n 2.put egg. \n 3. heat till cook";
        Omlette.image = @"omlette.jpeg";
        
        if ([ViewControl.ingredient1 isEqualToString:@"egg"]) {
            NSLog (@"data passed");
            [self.TheRecipes addObject:Omlette];
        }
        

    
        
        
        
       
        Recipes *CheeseToasty = [[Recipes alloc] init];
        CheeseToasty.foodname = @"Cheese Toasty";
        CheeseToasty.Description = @" Toast with cheese";
        CheeseToasty.ingredients = [NSString stringWithFormat:@"Ingredients: %@ %@ %@",bread,butter,cheese];
        CheeseToasty.steps = @"1.Spread butter on two slices bread. /n 2.Put it on a pan and toast both sides. /n 3. Put cheese on one of the bread and place the other slice on top of it. /n 4. Heat for a min";
        CheeseToasty.image = @"grilledcheese.jpg";
        
        [self.TheRecipes addObject:CheeseToasty];
        
        
        /*
        self.TheRecipes = [NSMutableArray array];
        Recipes *Bolognese = [[Recipes alloc] init];
        Bolognese.foodname = @"Spaghetti Bolognese";
        Bolognese.Description = @" it's spahgetti bolognese";
        Bolognese.ingredients = @"spaghetti" @"oil" @"tomato paste" @"tomatoes" @"tomato puree" @"Onions" @"Mince meat" @"Garlic" @"Oregano" @"bay leaves";
        Bolognese.steps = @"1.Heat oil on the pan 2. Fry onions till it brownish in color and add minced meat 2. When mince meat is cooked,";
        
        self.TheRecipes = [NSMutableArray array];
        Recipes *Wrap = [[Recipes alloc] init];
        Wrap.foodname = @"Wrap";
        Wrap.Description = @" You can put anything you want as long as it is edible";
        Wrap.ingredients = @"wrap";
        Wrap.steps = @"1.Open wrap 2. Add whatever you want 3. Wrap it";
        
        self.TheRecipes = [NSMutableArray array];
        Recipes *GrilledChicken = [[Recipes alloc] init];
        GrilledChicken.foodname = @"Grilled chicken";
        GrilledChicken.Description = @" Easy to make grilled chicken";
        GrilledChicken.ingredients = @"chicken breast";
        GrilledChicken.steps = @"1.Pre heat oven at 175 degree celcius 2. Add a bit of oil, salt and pepper 2. You can add other stuff such as tomato paste or cheese so that chicken wouldn't be too dry 3. Put it in the oven for 30 mins";
        
        self.TheRecipes = [NSMutableArray array];
        Recipes *StirFryVegetables = [[Recipes alloc] init];
        StirFryVegetables.foodname = @"Stir Fry Vegetables";
        StirFryVegetables.Description = @" Healthy stir fry vegetables ";
        StirFryVegetables.ingredients = @"Brocolli" @"Oyster sauce" ;
        StirFryVegetables.steps = @"1.Heat oil on a pan 2. Add oyster sauce and brocolli 3. Fry it for a couple of miniutes and add a pinch of salt";
        
        
        
        [self.TheRecipes addObject:Bolognese];
        [self.TheRecipes addObject:Wrap];
        [self.TheRecipes addObject:GrilledChicken];
        [self.TheRecipes addObject:StirFryVegetables];
        
        */
        
        
        
    }
    return self;
}



@end
