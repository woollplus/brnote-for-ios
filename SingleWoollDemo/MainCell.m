//
//  MainCell.m
//  NT
//
//  Created by Kohn on 14-5-27.
//  Copyright (c) 2014年 Pem. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        _Headerphoto = [[UIImageView alloc]initWithFrame:CGRectMake(6, 5, 50, 50)];
        [self.contentView addSubview:_Headerphoto];
    
        //名字
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, 200, 25)];
        _nameLabel.backgroundColor  = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        
        //简介
        _IntroductionLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 28, 240, 25)];
        _IntroductionLabel.backgroundColor  = [UIColor clearColor];
        _IntroductionLabel.textColor = [UIColor lightGrayColor];
        _IntroductionLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_IntroductionLabel];
        
        //网络
        _networkLabel = [[UILabel alloc]initWithFrame:CGRectMake(290, 5, 50, 25)];
        _networkLabel.backgroundColor  = [UIColor clearColor];
        _networkLabel.textColor = [UIColor lightGrayColor];
        _networkLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_networkLabel];
        
        //分割线
        _imageLine = [[UIImageView alloc]initWithFrame:CGRectMake(60, 59, 320-60, 1)];
        [self.contentView addSubview:_imageLine];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (void)setMainCell
{
    
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
