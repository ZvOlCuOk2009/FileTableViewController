//
//  Model.h
//  FileTableViewController
//
//  Created by Mac on 26.01.17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Image,
    PDF,
    Movie,
    Music
} FileType;

@interface Model : NSObject

@property (strong, nonatomic) NSString *nameFile;
@property (strong, nonatomic) NSString *isFolder;
@property (strong, nonatomic) NSDate *modData;
@property (assign, nonatomic) BOOL isOrange;
@property (assign, nonatomic) BOOL isBlue;

@end
