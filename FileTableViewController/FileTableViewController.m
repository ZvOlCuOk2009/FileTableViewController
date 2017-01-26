//
//  FileTableViewController.m
//  FileTableViewController
//
//  Created by Mac on 26.01.17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "FileTableViewController.h"
#import "TableViewCell.h"
#import "Model.h"

#import <MGSwipeTableCell.h>

@interface FileTableViewController () <MGSwipeTableCellDelegate>

@property (strong, nonatomic) NSMutableArray *fileModel;

@end

@implementation FileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fileModel = [NSMutableArray array];
    NSInteger countDataSource = arc4random_uniform(10) + 15;
    
    for (int i = 0; i < countDataSource; i++) {
        Model *model = [[Model alloc] init];
        [self.fileModel addObject:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.fileModel count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * reuseIdentifier = @"cell";
    MGSwipeTableCell * cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    
    Model *model = [self.fileModel objectAtIndex:indexPath.row];
    
    NSInteger random = arc4random_uniform(100);
    
    NSString *title = nil;
    UIImage *image = nil;
    
    if (random <= 50) {
        title = model.nameFile;
        image = [UIImage imageNamed:@"file"];
    } else if (random > 50) {
        title = model.isFolder;
        image = [UIImage imageNamed:@"folder"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", title, model.modData];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", title, model.modData];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-bold" size:14];
    cell.imageView.image = image;
    cell.delegate = self;
    
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"delete"] backgroundColor:[UIColor whiteColor]],
                         [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"favorite"] backgroundColor:[UIColor whiteColor]],
                          [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"link"] backgroundColor:[UIColor whiteColor]]];
    cell.leftSwipeSettings.transition = MGSwipeTransitionStatic;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSString *text = cell.textLabel.text;
    NSArray *component = [text componentsSeparatedByString:@"."];
    
    if ([component count] > 1) {
        NSLog(@"File");
    } else {
        NSLog(@"Folder");
//        NSArray *controllers = self.navigationController.viewControllers;
//        UITableViewController *controller = [controllers firstObject];
//        UIViewController *controller = [self.navigationController visibleViewController];
//        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (BOOL)swipeTableCell:(MGSwipeTableCell*)cell tappedButtonAtIndex:(NSInteger)index direction:(MGSwipeDirection)direction fromExpansion:(BOOL)fromExpansion
{
    if (index == 0) {
        NSLog(@"Delete");
    } else if (index == 1) {
        NSLog(@"Favorite");
    } else if (index == 2) {
        NSLog(@"Link");
    }
    return YES;
}


@end
