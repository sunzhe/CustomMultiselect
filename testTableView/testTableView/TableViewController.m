//
//  TableViewController.m
//  testTableView
//
//  Created by ioszhe on 16/1/25.
//  Copyright © 2016年 ioszhe. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"
@interface TableViewController (){
    UIButton *_selectBtn;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectBtn setTitle:@"选择" forState:UIControlStateNormal];
    [_selectBtn addTarget:self action:@selector(onSelectClick) forControlEvents:UIControlEventTouchUpInside];
    _selectBtn.frame = CGRectMake(0, 0, 60, 60);
    [_selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_selectBtn];
    self.tableView.rowHeight = 60;
    
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)onSelectClick {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    //[self.tableView reloadData];
    [_selectBtn setTitle:self.tableView.editing ? @"完成" : @"选择" forState:UIControlStateNormal];
    
    if (!self.tableView.editing) {
        NSArray *arr = [self.tableView indexPathsForSelectedRows];
    }
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld", indexPath.row];
    
    
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIView *_editingData = [cell valueForKey:@"_editingData"];
    UIView *_editControl = [_editingData valueForKey:@"_editControl"];
    UIImageView *_imageView = [_editControl valueForKey:@"_imageView"];
    
    if (cell.selected) {
        _imageView.backgroundColor = [UIColor greenColor];
    }else {
        _imageView.backgroundColor = [UIColor grayColor];
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
