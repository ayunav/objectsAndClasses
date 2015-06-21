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

-(BOOL)withdraw:(int) amount{
    int left = self.balance - amount;
    if (left<0) {
        NSLog(@"Insufficient Funds");
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
}

@end

@interface Patron : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) BankAccount *account;
@property (nonatomic) int moneyInPocket;

-(void) setBankAccount:(BankAccount*) anAccount;
-(void) withdrawMoney:(int)amount;
-(void) depositMoney:(int)amount;


@end

@implementation Patron

-(void) setBankAccount:(BankAccount*) anAccount{
    self.account = anAccount;
}

-(void) withdrawMoney:(int)amount{
    
    BOOL gotMoney = [self.account withdraw:amount];
    if (gotMoney) {
        self.moneyInPocket = self.moneyInPocket + amount;
        NSLog(@"$%d in pocket", self.moneyInPocket);
    }

}


@end





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *account = [[BankAccount alloc] init];
        account.balance = 10000;
        Patron *Natalia = [[Patron alloc] init];
        Natalia.moneyInPocket = 300;
        Natalia.account = account;
        [Natalia withdrawMoney:20];

    }
    return 0;
}
