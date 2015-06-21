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
//@property (nonatomic) BankAccount *account;
@property (nonatomic) NSMutableArray *accounts;
@property (nonatomic) int moneyInPocket;

-(void) addAccount:(int) balance;
-(void) setBankAccount:(BankAccount*) anAccount;
-(void) withdrawMoney:(int)amount;
-(void) depositMoney:(int)amount;


@end

@implementation Patron

-(void) addAccount:(int) balance{
    BankAccount *newAccount = [[BankAccount alloc] init];
    newAccount.balance = balance;
    [self.accounts addObject:newAccount];
}

//-(void) setBankAccount:(BankAccount*) anAccount{
//
//    self.account = anAccount;
//}

-(void) withdrawMoney:(int)amount{
    //get the Bank Account object from the array
    //change that object's properties
    
    BOOL gotMoney = [self.account withdraw:amount];
    if (gotMoney) {
        self.moneyInPocket = self.moneyInPocket + amount;
        NSLog(@"$%d in ya pocket", self.moneyInPocket);
    }
    
}

-(void) depositMoney:(int)amount{
    if (self.moneyInPocket >= amount) {
        [self.account deposit:amount];
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
        
//        BankAccount *account = [[BankAccount alloc] init];
//        account.balance = 10000;
        Patron *Natalia = [[Patron alloc] init];
        Natalia.moneyInPocket = 300;
        [Natalia addAccount:10000];
        //Natalia.account = account;
        [Natalia withdrawMoney: 2];
        [Natalia depositMoney:600];
        
    }
    return 0;
}
