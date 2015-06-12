//
//  ViewController.m
//  GeoHex-ObjectiveC-CrashSample
//
//  Created by Mihyaeru on H27/06/12.
//  Copyright (c) 平成27年 Mihyaeru. All rights reserved.
//

#import "ViewController.h"
#import <GeoHexV3.h>


@interface ViewController ()
@property (strong, nonatomic, readonly) NSString *code;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    // using manual reference counting
    //

    _code = [[NSString alloc] initWithUTF8String:"RU0585864"];
    NSLog(@"retain count: %ld", self.code.retainCount);            // => 1

    GeoHexV3 *geohex = [[GeoHexV3 alloc] initFromCode:self.code];
    NSLog(@"retain count: %ld", self.code.retainCount);            // => 1
    NSLog(@"%@", self.code);                                       // => RU0585864
    NSLog(@"%@", geohex.code);                                     // => RU0585864

    [geohex release];                                              // will release self.code

    NSLog(@"retain count: %ld", self.code.retainCount);            // will cause crash
    NSLog(@"%@", self.code);
}

@end
