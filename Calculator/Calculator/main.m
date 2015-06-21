//
//  main.m
//  Calculator
//
//  Created by Henna on 6/21/15.
//  Copyright (c) 2015 Henna and Natalia. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Calculator : NSObject

@property (nonatomic) int accumulator;
@property (nonatomic) int sign;
-(void)initializeVariables;
-(void)add:(int)a;
-(void)substract:(int)b;
-(void)multiply:(int)c;
-(void)divide:(int)d;
-(void)printResult;
-(void)changeSign;

@end

@implementation Calculator

-(void)initializeVariables{
    self.accumulator = 0;
    self.sign = 1;
}
-(void)changeSign {
    self.sign = self.sign * -1;
}

-(void)add:(int)a {
    self.accumulator = self.accumulator + (self.sign * a);

}

-(void)substract:(int)b {
    self.accumulator = self.accumulator - (self.sign * b);
}

-(void)multiply:(int)c {
    self.accumulator = self.accumulator * c * self.sign;
}

-(void)divide:(int)d {
    self.accumulator = self.accumulator / (self.sign *d);
}

-(void)printResult{
    NSLog(@"The answer is: %d", self.accumulator);
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

    }
    return 0;
}
