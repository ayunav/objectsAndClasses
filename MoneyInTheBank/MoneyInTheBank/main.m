//
//  main.m
//  MoneyInTheBank
//
//  Created by Henna on 6/21/15.
//  Copyright (c) 2015 Henna and Natalia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic) int balance;

-(BOOL)withdraw:(int)amount;
-(void)deposit:(int)amount;
@end

@implementation BankAccount

-(BOOL)withdraw:(int) amount {
    int left = self.balance - amount;
    if (left<0) {
        NSLog(@"No money no problems, right?");
        return NO;
    }
    else{
        self.balance = left;
        NSLog(@"$%d left", self.balance);
        return YES;
    }
}
-(void)deposit:(int)amount{
    self.balance = self.balance + amount;
    NSLog(@"Z'money in ZBank: %d", self.balance);
}

@end

@interface Patron : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray *accounts;
@property (nonatomic) int moneyInPocket;

-(void) addAccount:(int) balance;
-(void) withdrawAmount:(int)amount fromAccount:(BankAccount *)account;
-(void) depositAmount:(int)amount toAccount:(BankAccount *)account;

@end

@implementation Patron

-(void) addAccount:(int) balance{
    BankAccount *newAccount = [[BankAccount alloc] init];
    newAccount.balance = balance;
    [self.accounts addObject:newAccount];
}

-(void) withdrawAmount:(int)amount fromAccount:(BankAccount *)account{
    BOOL gotMoney = [account withdraw:amount];
    
    if (gotMoney) {
        self.moneyInPocket = self.moneyInPocket + amount;
        NSLog(@"$%d in ya pocket", self.moneyInPocket);
    }
    
}


-(void) depositAmount:(int)amount toAccount:(BankAccount *)account{
    if (self.moneyInPocket >= amount) {
        [account deposit:amount];
        self.moneyInPocket = self.moneyInPocket - amount;
        NSLog(@"Z'money in Z'pocket: %d", self.moneyInPocket);
    }
    else{
        NSLog(@"You is broke, Booboo :(");
    }
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Patron *Natalia = [[Patron alloc] init];
        [Natalia addAccount:10000];
        Natalia.moneyInPocket = 300;
        [Natalia withdrawAmount:100 fromAccount:[Natalia.accounts firstObject]];
        [Natalia depositAmount:2 toAccount:[Natalia.accounts firstObject]];
        
    }
    return 0;
}
