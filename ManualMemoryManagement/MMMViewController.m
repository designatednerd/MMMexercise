//
//  MMMViewController.m
//  ManualMemoryManagement
//
//  Created by Sean Wolter on 7/18/14.
//  Copyright (c) 2014 VOKAL. All rights reserved.
//

#import "MMMViewController.h"
#import "MMMFish.h"

@interface MMMViewController () <UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *fishArray;
@end

@implementation MMMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *fishArray = [NSMutableArray array];
    self.fishArray = fishArray; //Where is `fishArray` retained?
}

- (IBAction)tappedMoreFishButton:(UIButton *)sender
{
    [self.fishArray addObject:[MMMFish fish]];
    [self.tableView reloadData];
}

- (IBAction)tappedDeleteFishButton:(UIButton *)sender
{
    [self.fishArray removeAllObjects];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [self.fishArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FishCellIdentifier = @"derrr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FishCellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                       reuseIdentifier:FishCellIdentifier] autorelease]; //Why autorelease?
    }
    MMMFish *fishAtIndex = self.fishArray[indexPath.row];
    cell.textLabel.text = fishAtIndex.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[fishAtIndex countFromGarbageData]];

    return cell;
}

- (void)dealloc {
    [_tableView release];
    [_fishArray release];
    [super dealloc];
}
@end
