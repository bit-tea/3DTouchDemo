//
//  BTForceTouch.m
//  ForceTouchTest
//
//  Created by bit_tea on 15/06/2017.
//  Copyright © 2017 bit_tea. All rights reserved.
//

#import "BTForceTouch.h"

@implementation BTForceTouch

+ (BTForceTouch *)sharedInstance
{
    static BTForceTouch *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BTForceTouch alloc]init];
    });
    return sharedInstance;
}

- (void)initWithTitleArray:(NSArray *)titleArray iconArray:(NSArray *)iconArray
{
    [self initWithTitleArray:titleArray subTitleArray:nil iconArray:iconArray];
}

- (void)initWithTitleArray:(NSArray *)titleArray subTitleArray:(NSArray *)subTitleArray iconArray:(NSArray *)iconArray
{
    _titleArray = titleArray;
    
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        
        UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:iconArray[i]];
        UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:@"BTType" localizedTitle:titleArray[i] localizedSubtitle:subTitleArray[i] icon:icon userInfo:nil];
        [items addObject:item];
    }
    
    NSArray *existingItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems = [existingItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = updatedItems;
}

- (void)handlePerformActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
{
    [_titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = (NSString *)obj;
        if ([shortcutItem.localizedTitle isEqualToString:title] && self.performedIndex) {
            self.performedIndex(idx);
            return;
        }
    }];
}

@end
