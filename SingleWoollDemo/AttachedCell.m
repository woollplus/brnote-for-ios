//
//  AttachedCell.m
//  NT
//
//  Created by Kohn on 14-5-27.
//  Copyright (c) 2014年 Pem. All rights reserved.
//

#import "AttachedCell.h"
#import "UIButton+Create.h"

@implementation AttachedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //分割线
        _imageLine = [[UIImageView alloc]initWithFrame:CGRectMake(60, 39, 320-60, 1)];
        [self.contentView addSubview:_imageLine];
        
        UIButton *b1 = [UIButton createButtonWithFrame:CGRectMake(70, 9, 50, 20) Title:@"语音" Target:self Selector:@selector(btnAction:)];
        
        b1.tag = 100;
        
        UIButton *b2 = [UIButton createButtonWithFrame:CGRectMake(130, 9, 50, 20) Title:@"视频" Target:self Selector:@selector(btnAction:)];
        b2.tag = 200;
        
        UIButton *b3 = [UIButton createButtonWithFrame:CGRectMake(190, 9, 50, 20) Title:@"图片" Target:self Selector:@selector(btnAction:)];
        b3.tag = 300;
        
        UIButton *b4 = [UIButton createButtonWithFrame:CGRectMake(250, 9, 50, 20) Title:@"表情" Target:self Selector:@selector(btnAction:)];
        
        b4.tag = 400;
        
        [self.contentView addSubview:b1];
        [self.contentView addSubview:b2];
        [self.contentView addSubview:b3];
        [self.contentView addSubview:b4];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (void)btnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 100:
        {
            NSLog(@">>>>>>>>>>语音");
        }
            break;
        case 200:
        {
            NSLog(@">>>>>>>>>>视频");
        }
            break;
        case 300:
        {
            NSLog(@">>>>>>>>>>图片");
        }
            break;
        case 400:
        {
            NSLog(@">>>>>>>>>>表情");
        }
            break;
        case 500:
        {
            NSLog(@">>>>>>>>>>文件");
        }
            break;
            
        default:
            break;
    }
    
    
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
