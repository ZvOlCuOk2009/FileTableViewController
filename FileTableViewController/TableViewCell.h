//
//  TableViewCell.h
//  FileTableViewController
//
//  Created by Mac on 26.01.17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGSwipeTableCell.h>

@interface TableViewCell : MGSwipeTableCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end
