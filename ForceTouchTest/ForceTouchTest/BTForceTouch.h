//
//  BTForceTouch.h
//  ForceTouchTest
//
//  Created by bit_tea on 15/06/2017.
//  Copyright © 2017 bit_tea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BTForceTouch : NSObject

@property (nonatomic, copy, readonly) NSArray *titleArray;
@property (nonatomic, copy) void(^performedIndex)(NSInteger index);

+ (BTForceTouch *)sharedInstance;

///Please be sure the title,icon have a same amount and it have a system amount limit:up to 4.
- (void)initWithTitleArray:(NSArray *)titleArray iconArray:(NSArray *)iconArray;
///Please be sure the title,subtitle,icon have a same amount and it have a system amount limit:up to 4.
- (void)initWithTitleArray:(NSArray *)titleArray subTitleArray:(NSArray *)subTitleArray iconArray:(NSArray *)iconArray;

- (void)handlePerformActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem;

@end
