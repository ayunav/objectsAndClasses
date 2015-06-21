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

-(void)add:(int)a{
    self.accumulator = self.accumulator + a;
    //NSLog(@"%d", self.accumulator);
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Calculator *computation = [[Calculator alloc] init];
        [computation add:4];
        [computation add:4];

    }
    return 0;
}
