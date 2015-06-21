//
//  main.m
//  Calculator
//
//  Created by Henna on 6/21/15.
//  Copyright (c) 2015 Henna and Natalia. All rights reserved.
//

#import <Foundation/Foundation.h>

//Set class of Calculator
//    Properties store info
//    methods/functions make shit happen (change shit).
@interface Calculator : NSObject

@property (nonatomic) int accumulator;
@property (nonatomic) int sign;
@property (nonatomic) int memory;
-(void)initializeVariables;
-(void)add:(int)a;
-(void)substract:(int)b;
-(void)multiply:(int)c;
-(void)divide:(int)d;
-(void)printResult;
-(void)changeSign;
-(void)getReciprocal;
-(void)getSqaured;
-(void)memoryRecall;

@end
//METHOD TO PROPERTY
//Here we implement the methods/functions and properties of a .
//    we set the METHODS in relation to the PROPERTIES
@implementation Calculator

-(void)initializeVariables {
    self.accumulator = 0;
    self.sign = 1;
}

-(void)add:(int)a {
    self.accumulator = self.accumulator + (self.sign * a);
    self.memory = self.accumulator;
}

-(void)substract:(int)b {
    self.accumulator = self.accumulator - (self.sign * b);
    self.memory = self.accumulator;
}

-(void)multiply:(int)c {
    self.accumulator = self.accumulator * c * self.sign;
    self.memory = self.accumulator;
}

-(void)divide:(int)d {
    self.accumulator = self.accumulator / (self.sign *d);
    self.memory = self.accumulator;
}

-(void)printResult{
    NSLog(@"The answer is: %d", self.accumulator);
}

-(void)changeSign {
    self.sign = self.sign * -1;
}

-(void)getReciprocal {
    NSLog(@"The reciprocal is: 1 / %d", self.accumulator);
}

-(void)getSqaured {
    NSLog(@"Your answer sqaured is: %d", self.accumulator * self.accumulator);
}

-(void)memoryRecall {
    self.accumulator = self.memory;
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Calculator *computation = [[Calculator alloc] init];
        [computation initializeVariables];
        [computation add:4];
        [computation changeSign];
        [computation add:4];
        [computation add: 5];
        [computation multiply:10];
        [computation divide:5];
        [computation printResult];
        [computation getReciprocal];
        [computation getSqaured];
        //memory clear
        [computation initializeVariables];
        [computation printResult];
        [computation memoryRecall];
        [computation printResult];
        

    }
    return 0;
}
