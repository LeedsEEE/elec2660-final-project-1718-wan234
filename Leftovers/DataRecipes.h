//
//  DataRecipes.h
//  Leftovers
//
//  Created by Wan Bin Wan Ahmad Ifafudin [el16waaw] on 17/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipes.h"
#import "SearchViewController.h"




@interface DataRecipes : NSObject

@property (strong, nonatomic) NSMutableArray *TheRecipes;

@property (strong, nonatomic) NSString *theData;


-(void)removeEgg;
@end
