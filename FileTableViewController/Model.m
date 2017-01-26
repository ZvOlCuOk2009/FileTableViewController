//
//  Model.m
//  FileTableViewController
//
//  Created by Mac on 26.01.17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameFile = [self randomNameFile];
        self.isFolder = [self randomNameFolder];
        self.modData = [self randomDate];
        self.isOrange = [self randomColor];
        self.isBlue = [self randomColor];
    }
    return self;
}

- (NSString *)randomNameFile
{
    NSArray *nameFiles = @[@"Speech.doxc", @"WorkPowerpoint.pptx", @"ForWork.doc", @"Any.doc"];
    NSUInteger position = arc4random() % ([nameFiles count]);
    NSString *nameFile = [NSString stringWithFormat:@"%@", [nameFiles objectAtIndex:position]];
    return nameFile;
}

- (NSString *)randomNameFolder
{
    NSArray *nameFolders = @[@"Family Shared", @"For Work", @"Tom's Folder", @"Any Folder"];
    NSUInteger position = arc4random() % ([nameFolders count]);
    NSString *nameFolder = [NSString stringWithFormat:@"%@", [nameFolders objectAtIndex:position]];
    return nameFolder;
}

- (NSDate *)randomDate
{
    NSDate *date = [NSDate date];
    return date;
}

- (BOOL)randomColor
{
    NSUInteger random = arc4random_uniform(100);
    BOOL position;
    if (random <= 50) {
        position = YES;
    } else if (random > 50) {
        position = NO;
    }
    return position;
}

@end
