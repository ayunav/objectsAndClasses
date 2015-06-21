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
-(void)add:(int)a;
-(void)substract:(int)b;
-(void)multiply:(int)c;
-(void)divide:(int)d;

@end

@implementation Calculator

-(void)add:(int)a {
    self.accumulator = self.accumulator + a;
    NSLog(@"%d", self.accumulator);
}

-(void)substract:(int)b {
    self.accumulator = self.accumulator - b;
    NSLog(@"%d", self.accumulator);

}

-(void)multiply:(int)c {
    self.accumulator = self.accumulator * c;
    NSLog(@"%d", self.accumulator);

}

-(void)divide:(int)d {
    self.accumulator = self.accumulator / d;
    NSLog(@"%d", self.accumulator);
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Calculator *computation = [[Calculator alloc] init];
        [computation add:4];
        [computation add:4];
        [computation substract: 5];
        [computation multiply:10];
        [computation divide:5];

    }
    return 0;
}
