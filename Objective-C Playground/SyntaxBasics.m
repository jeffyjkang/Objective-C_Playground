//
//  SyntaxBasics.m
//  Objective-C Playground
//
//  Created by Jeff Kang on 3/19/21.
//

#import "SyntaxBasics.h"

@implementation SyntaxBasics

// use %@ for type format, and let xcode handle with error check

+ (void)classMethod
{
    NSLog(@"You called a class method on %@!", self);
}

- (instancetype)initWithLargeNumber:(NSNumber *)largeNumber smallInteger:(int)smallInteger
{
//    self = [super init];
//    if (self) {
//    }
    if (self = [super init]) {
        self.largeNumber = largeNumber;
        self.smallInteger = smallInteger;
    }
    return self;
}

- (void)instanceMethod
{
    NSLog(@"You called an instance method on %@!", self);
}

- (void)instanceMethodWithString:(NSString *)aString
{
    NSLog(@"You called an instance method with \"%@\" on %@!", aString, self);
}

- (void)instanceMethodWithString:(NSString *)aString andNumber:(NSNumber *)aNumber
{
    NSLog(@"You called an instance method with \"%@\" and %@ on %@!", aString, aNumber, self);
}

- (NSString *)returningInstanceMethodWithString:(NSString *)aString andNumber:(NSNumber *)aNumber
{
    NSLog(@"You called an instance method with \"%@\" and %@ on %@!", aString, aNumber, self);
    
    return @"Got it!";
}

- (void)explorePrimitives
{
    // Primitives - number types
    NSLog(@"-----Primitives-----");
    
    // Integer
    // 4 bytes wide, -2,147,483,648 through 2,147,483,647
    int age = 30;
    NSLog(@"Hello! You are %d years old.", age);
    
    // Long integer
    // 8 bytes wide, -9,223,372,036,854,775,808 through 9,223,372,036,854,775,807
    long aLong = 9223372036854;
    NSLog(@"%ld", aLong);
    
    // Single precision floating-point, 32-bit number
    float aFloat = -21.09f;
    NSLog(@"%f", aFloat);
    NSLog(@"%.2f", aFloat);
    
    // Double precision floating-point, 64-bit number
    double aDouble = -21.09;
    NSLog(@"%.2f", aDouble);
    NSLog(@"%e", aDouble);
    
    // Boolean
    // only two value choices, YES for true, NO for false
    BOOL isBool = YES;
    NSLog(@"%d", isBool); // prints 1 for YES, 0 for NO
    NSLog(@"%@", isBool ? @"YES" : @"NO");
    
    // Math
    // All standard arithmetic operators apply: +, -, *, /, %
    
    // Integer division, result is always a whole number and not rounded
    int integerResult = 5 / 4;
    NSLog(@"Integer division: %d", integerResult);
    
    // Double division, 1 double and 1 int operand, result is promoted to double
    double doubleResult = 5. / 4;
    NSLog(@"Floating-point division: %f", doubleResult);
    
    // Floating point imprecision
    // Print statements show floating point numbers aren't as precise as they appear
    NSLog(@"%.17f", .1);
    NSLog(@"%.1f", 4.2 - 4.1); // actual answer: 0.10000000000000053
    // if (ABS(a - b) < 0.001)
    
    // NSInteger
    
    // autosizes itself based on current platform
    NSInteger anInteger = -6;
    NSUInteger aPositiveInteger = 8;
    NSLog(@"anInteger: %ld", (long)anInteger);
    NSLog(@"aPositiveInteger: %lu", (unsigned long)aPositiveInteger); // UInt64(aPositiveInteger)
    NSLog(@"-----End Primitives-----\n\n");
}

- (void)exploreObjects
{
    // Objects (class-based types)
    NSLog(@"-----Objects-----");
    
    // NSString
    NSString *lambda = @"Lambda School";
    NSLog(@"%@", lambda);
    // NSLog(lambda); // don't do this!
    
    // String concatenation/ interpolation
    // Swift
    // let width = 94
    // let label = "The width is \(width)"
    
    NSString *label = @"The width is";
    int width = 94;
    NSString *widthLabel = [NSString stringWithFormat:@"%@ %d", label, width];
    NSLog(@"%@", widthLabel);
    
    // id type used to store an object of any type
    // Swift
    // let anyObject: Any = "Hello"
    
    id mysteryObject = @"An NSString object";
    NSLog(@"%@", [mysteryObject description]);
    // NSLog(@"The count is %d", [mysteryObject count]);
    mysteryObject = @{@"model": @"Ford", @"Year": @1967};
    NSLog(@"%@", [mysteryObject description]);
    // NSLog(@"The count is %d", [mysteryObject count]);
    
    NSLog(@"-----End Objects-----");
}

- (void)exploreCollectionsWithArray:(NSArray *)shipCaptains
{
    NSLog(@"-----Collections-----");
    
    // Array - ordered collection of objects, immutable
    NSLog(@"Serenity: %@", shipCaptains[0]);
    NSLog(@"Serenity: %@", [shipCaptains objectAtIndex: 0]);
    
    // Array comparison
    NSArray *sameCaptains = @[@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Kathryn Janeway"];
    if ([shipCaptains isEqualToArray:sameCaptains]) {
        NSLog(@"Arrays are equal!");
    }
    
    // for loop syntax for iterating a collection
    for (int i = 0; i < shipCaptains.count; i++) {
        NSLog(@"Captain on the bridge: %@", shipCaptains[i]);
    }
    
    // int i = 0
    // while (i < shipCaptains.count) {
    // NSLog(@"Captain on the bridge: %@", shipCaptains[i]);
    // i += 1;
    // }
    
    // for in loop
    for (NSString *name in shipCaptains) {
        NSLog(@"%@", name);
    }
    
    // Check element for membership
    if ([shipCaptains containsObject: @"Kathryn Janeway"]) {
        NSLog(@"U.S.S. Voyager reporting for duty.");
    }
    
    // Find index of object
    NSUInteger index = [shipCaptains indexOfObject:@"James T. Kirk"];
    if (index == NSNotFound) {
        NSLog(@"Captain not found!");
    } else {
        NSLog(@"Captain %@ was found at index %lu", shipCaptains[index], (unsigned long)index);
    }
    
    // Same as above NSArray type, except can be mutated
    // note: array literal syntax can't be used for NSMutableArray
    NSMutableArray *mutableShipCaptains = [[NSMutableArray alloc] initWithObjects:@"Malcolm Reynolds", @"James T. Kirk", nil];
    [mutableShipCaptains addObject:@"Han Solo"];
    // [mutableShipCaptains addObjectsFromArray:@[@"Jean-Luc-Picard", @"Kathryn Janeway"]];
    // [mutableShipCaptains addObject:@(index)];
    NSLog(@"%@", mutableShipCaptains);
    
    // Dictionary - unordered collection of key-value pairs, immutable
    
    NSDictionary *occupations = @{@"Malcolm": @"Captain",@"Kaylee": @"Mechanic"};
    NSLog(@"%@", [occupations objectForKey:@"Malcolm"]); // occupations[@"Malcolm"]
    
    // NSMutableDicionary - same as above, but can be mutated
    // note: dictionary literal syntax can't be used for NSMutableDictionary
    NSMutableDictionary *mutableOccupations = [occupations mutableCopy];
    [mutableOccupations setObject:@"Public Relations" forKey:@"Jayne"];
    NSLog(@"%@", mutableOccupations);
    
    NSLog(@"-----End Collections-----");
}

- (void)exploreNumbers
{
    // NSNumber, a lightweight wrapper around the number primitives
    NSLog(@"-----NSNumber-----");
    
    // Once converted to NSNumber, value can be converted back
    // to a primitive with methods shown below
    
    NSNumber *aBool = [NSNumber numberWithBool:NO];
    NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
    
    NSNumber *intAsNumber = [NSNumber numberWithInt:2147483647];
    NSLog(@"%i", [intAsNumber intValue]);
    
    NSNumber *longAsNumber = [NSNumber numberWithLong:9223372036854775807];
    NSLog(@"%li", [longAsNumber longValue]);
    
    NSNumber *floatAsNumber = [NSNumber numberWithFloat:26.99f];
    NSLog(@"%f", [floatAsNumber floatValue]);
    
    NSNumber *doubleAsNumber = [NSNumber numberWithDouble:26.99];
    NSLog(@"%f", [doubleAsNumber doubleValue]);
    
    // It's also possible to convert an NSNumber to a string
    NSString *asString = [self.largeNumber stringValue];
    NSLog(@"%@", asString);
    
    // The following literal shortcuts allow for easier NSNumber
    // initialization compared to the above methods
    NSNumber *boolLiteral = @NO;
    NSNumber *intLiteral = @42;
    NSNumber *longLiteral = @9223372036854775807L;
    NSNumber *floatLiteral = @26.99F;
    NSNumber *doubleLiteral = @26.99; // @(myPrimitive)
    NSLog(@"bool: %@, int: %@, long: %@, float: %@, double: %@", boolLiteral, intLiteral, longLiteral, floatLiteral, doubleLiteral);
    
    NSNumber *aNumber = @12.5;
    NSNumber *anotherNumber = @12.5;
    
    // Because both values are objects, == doesn't work in the usual way
    if (aNumber == anotherNumber) {
        NSLog(@"Numbers are equal");
    } else {
        NSLog(@"Numbers are not equal");
    }
    
    // NSNumber has a method for equating two number objects instead
    if ([anotherNumber isEqualToNumber:aNumber]) {
        NSLog(@"Numbers are equal");
    } else {
        NSLog(@"Numbers are not equal");
    }
    
    NSLog(@"-----End NSNumber-----");
}

@end
