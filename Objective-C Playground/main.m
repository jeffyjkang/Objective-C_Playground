//
//  main.m
//  Objective-C Playground
//
//  Created by Jeff Kang on 3/19/21.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "SyntaxBasics.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        NSLog(@"Hello, World");
        
        SyntaxBasics *object = [[SyntaxBasics alloc] init];
        
        [object instanceMethod];
        [object instanceMethodWithString:@"Hello!"];
        [object instanceMethodWithString:@"World!" andNumber:@42];
        
        NSString *returnedValue = [object returningInstanceMethodWithString:@"Hi" andNumber:@7];
        NSLog(@"The method returned %@", returnedValue);
        
        [SyntaxBasics classMethod];
        
        SyntaxBasics *basics = [[SyntaxBasics alloc] initWithLargeNumber:@87693483554 smallInteger:42];
        
        [basics explorePrimitives];
        [basics exploreObjects];
        [basics exploreCollectionsWithArray:@[
            @"Malcolm Reynolds",
            @"Jean-Luc Picard",
            @"James T. Kirk",
            @"Kathryn Janeway"
        ]];
        [basics exploreNumbers];
    }
//    return NSApplicationMain(argc, argv);
    return 0;
}
