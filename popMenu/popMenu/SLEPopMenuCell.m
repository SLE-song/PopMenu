//
//  SLEPopMenuCell.m
//  popMenu
//
//  Created by mzyw on 16/10/10.
//  Copyright © 2016年 宋帅超. All rights reserved.
//

#import "SLEPopMenuCell.h"




#define SLE_DEFAULT_MARGIN 10




@interface SLEPopMenuCell ()
@end


@implementation SLEPopMenuCell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 图片
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        self.sle_imageView = imageView;
        
        // label
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:label];
        self.sle_label = label;
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat contentViewWidth = self.contentView.frame.size.width;
    CGFloat contentViewHeight = self.contentView.frame.size.height;
    
    self.sle_imageView.frame = CGRectMake(SLE_DEFAULT_MARGIN, SLE_DEFAULT_MARGIN, contentViewHeight - 2*SLE_DEFAULT_MARGIN, contentViewHeight - 2*SLE_DEFAULT_MARGIN);
    
    self.sle_label.frame = CGRectMake(0, 0, contentViewWidth - CGRectGetMaxX(self.sle_imageView.frame) - 2*SLE_DEFAULT_MARGIN, 0);
    [self.sle_label sizeToFit];
    self.sle_label.center = CGPointMake(SLE_DEFAULT_MARGIN + CGRectGetMaxX(self.sle_imageView.frame) + self.sle_label.frame.size.width *0.5, contentViewHeight *0.5);
}




@end
