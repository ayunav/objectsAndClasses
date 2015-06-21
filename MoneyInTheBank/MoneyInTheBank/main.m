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

@end

@implementation BankAccount



@end

@interface Patron : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) BankAccount *account;
@property (nonatomic) int moneyInPocket;

-(void) setBankAccount:(BankAccount*) anAccount;

@end

@implementation Patron

-(void) setBankAccount:(BankAccount*) anAccount{
    self.account = anAccount;
}


@end





int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
