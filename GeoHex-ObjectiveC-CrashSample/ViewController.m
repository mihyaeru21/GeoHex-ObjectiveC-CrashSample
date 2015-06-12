//
//  ViewController.m
//  GeoHex-ObjectiveC-CrashSample
//
//  Created by Mihyaeru on H27/06/12.
//  Copyright (c) 平成27年 Mihyaeru. All rights reserved.
//

#import "ViewController.h"
#import <GeoHexV3.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    // using manual reference counting
    //

    NSString *code = [[NSString alloc] initWithUTF8String:"RU0585864"];
    NSLog(@"retain count: %ld", code.retainCount);            // => 1

    GeoHexV3 *geohex = [[GeoHexV3 alloc] initFromCode:code];
    NSLog(@"retain count: %ld", code.retainCount);            // => 1
    NSLog(@"%@", code);                                       // => RU0585864
    NSLog(@"%@", geohex.code);                                // => RU0585864

    [geohex release];                                         // will release self.code

    NSLog(@"retain count: %ld", code.retainCount);            // will cause crash
    NSLog(@"%@", code);
}

@end
