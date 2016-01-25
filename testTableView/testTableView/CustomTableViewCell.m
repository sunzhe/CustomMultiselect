//
//  CustomTableViewCell.m
//  testTableView
//
//  Created by ioszhe on 16/1/25.
//  Copyright © 2016年 ioszhe. All rights reserved.
//

#import "CustomTableViewCell.h"
@interface CustomTableViewCell(){
    
}
@property(nonatomic, strong)UIImageView *selImageView;
@end
@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (UIImageView *)selImageView{
    if (!_selImageView) {
        _selImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 20, 22, 22)];
        _selImageView.backgroundColor = [UIColor grayColor];
    }
    return _selImageView;
}

- (void)willTransitionToState:(UITableViewCellStateMask)state{
    [super willTransitionToState:state];
    UIView *_editingData = [self valueForKey:@"_editingData"];
    UIView *_editControl = [_editingData valueForKey:@"_editControl"];
    self.selImageView = [_editControl valueForKey:@"_imageView"];
    
    if (self.selected) {
        self.selImageView.backgroundColor = [UIColor greenColor];
    }else {
        self.selImageView.backgroundColor = [UIColor grayColor];
    }
    [_editControl addSubview:_selImageView];
    
}

- (void)didTransitionToState:(UITableViewCellStateMask)state{
    [super didTransitionToState:state];
    if (state == UITableViewCellStateShowingEditControlMask) {
        
    }

    UIView *_editingData = [self valueForKey:@"_editingData"];
    UIView *_editControl = [_editingData valueForKey:@"_editControl"];
    UIImageView *img = [_editControl valueForKey:@"_imageView"];
    img.hidden = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        _selImageView.backgroundColor = [UIColor greenColor];
    }else {
        _selImageView.backgroundColor = [UIColor grayColor];
    }
    // Configure the view for the selected state
}

@end
