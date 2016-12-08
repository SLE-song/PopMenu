//
//  SLEPopMenuView.m
//  popMenu
//
//  Created by mzyw on 16/10/10.
//  Copyright © 2016年 宋帅超. All rights reserved.
//

#import "SLEPopMenuView.h"
#import "SLEPopMenuCell.h"




enum meneStatus{
    popMenu ,
    disMenu
};

@interface SLEPopMenuView()<UITableViewDataSource,UITableViewDelegate>

// 背景图
@property (nonatomic, weak) UIImageView *menuImageView;

// 主视图高度
@property (nonatomic, assign) CGFloat menuViewHeight;

// tableView
@property (nonatomic, weak) UITableView *menuTableView;

// 图片资源
@property (nonatomic, strong) NSArray *imageNameArray;

// 方法
@property (nonatomic, assign) SEL selector;


@end


@implementation SLEPopMenuView

- (NSArray *)imageNameArray
{
    if (_imageNameArray == nil) {
        
        _imageNameArray = @[@"menu_calculate",@"menu_personalCenter",@"menu_recharge"];
    }
    return _imageNameArray;
}





static SLEPopMenuView *popMenuView;

+ (instancetype)shareMenuView
{
    if (popMenuView == nil) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            popMenuView = [[SLEPopMenuView alloc] init];
        });
    }

    return popMenuView;
}




- (void)setupInitData{
    
    self.frame = CGRectMake(20, 80, [UIScreen mainScreen].bounds.size.width * 0.6, self.imageNameArray.count * 44 + 22);
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"home_menubackground"];
    imageView.frame = self.frame;
    imageView.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height *0.5);
    [self addSubview:imageView];
    self.backgroundColor = [UIColor redColor];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_menubackground"]];
    self.autoresizesSubviews = NO;
    self.menuTableView = tableView;
    tableView.frame = self.frame;
    tableView.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height *0.5);
    tableView.contentInset = UIEdgeInsetsMake(19, 0, 0, 0);
    [self addSubview:tableView];
}


+ (void)sle_showPopMenuViewToView:(UIView *)toView
{

    [[SLEPopMenuView shareMenuView] setupInitData];
    [toView addSubview:[SLEPopMenuView shareMenuView]];

}

+ (void)sle_dismissPopMenuView{

    [[SLEPopMenuView shareMenuView] removeFromSuperview];
    [SLEPopMenuView shareMenuView].menuImageView = nil;
    [SLEPopMenuView shareMenuView].menuTableView = nil;

}






#pragma mark----<UITableViewDataSource>---
static NSString *SLEPopMenuCellID = @"SLEPopMenuCell";
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.imageNameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    SLEPopMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:SLEPopMenuCellID];
    if (cell == nil) {
        
        cell = [[SLEPopMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SLEPopMenuCellID];
    }

    
    
    cell.sle_imageView.image = [UIImage imageNamed:self.imageNameArray[indexPath.row]];
    
    cell.sle_label.text = @"自定义文字";
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        
        NSLog(@"点击了第一行");

    }else if(indexPath.row == 1){
    
        NSLog(@"点击了第二行");
    }else if (indexPath.row == 2){
    
        NSLog(@"点击了第三行");
    }


}


@end
