//
//  ZJLViewController.m
//  zhanKaiTableView
//
//  Created by 张欣琳 on 14-2-11.
//  Copyright (c) 2014年 张欣琳. All rights reserved.
//

#import "ZJLViewController.h"
#import "MainCell.h"
#import "AttachedCell.h"

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)

#pragma mark - 设备型号识别
#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


@interface ZJLViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableDictionary *dic;//存对应的数据
    NSMutableArray *selectedArr;//二级列表是否展开状态
    NSMutableArray *titleDataArray;
    NSArray *dataArray;//数据源，显示每个cell的数据
    NSMutableDictionary *stateDic;//三级列表是否展开状态
    NSMutableArray *grouparr0;
    NSMutableArray *grouparr1;
    NSMutableArray *grouparr2;
    NSMutableArray *grouparr3;
    NSMutableArray *grouparr4;
    NSMutableArray *grouparr5;
}

@end

@implementation ZJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"列表";
    
    dic = [[NSMutableDictionary alloc] init];
    selectedArr = [[NSMutableArray alloc] init];
    dataArray = [[NSArray alloc] init];
    
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320,SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    //不要分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [self initDataSource];
    
}

-(void)initDataSource
{
    titleDataArray = [[NSMutableArray alloc] initWithObjects:@"产品资料",@"客户资料",@" 重要资料",@"个人笔记", nil];
    
    NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"肖利",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"段婷婷",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"毛凡",@"name",@"NO",@"state",nil];
    
    grouparr0 = [[NSMutableArray alloc] initWithObjects:nameAndStateDic1,nameAndStateDic2,nameAndStateDic3, nil];
    
    NSMutableDictionary *nameAndStateDic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"晨晨姐",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"李涛",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"海波",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"张敏",@"name",@"NO",@"state",nil];
    
    grouparr1 = [[NSMutableArray alloc]initWithObjects:nameAndStateDic4,nameAndStateDic5,nameAndStateDic6,nameAndStateDic7, nil];
    
    NSMutableDictionary *nameAndStateDic8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"杨浩",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"小明",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic10 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"洋洋",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic11 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"赵蒙",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic12 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"小催",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic13 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"和平",@"name",@"NO",@"state",nil];
    
    grouparr2 = [[NSMutableArray alloc]initWithObjects:nameAndStateDic8,nameAndStateDic9,nameAndStateDic10,nameAndStateDic11,nameAndStateDic12,nameAndStateDic13,nil];
    
    NSMutableDictionary *nameAndStateDic14 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"老爸",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic15 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"老妈",@"name",@"NO",@"state",nil];
    
    grouparr3 = [[NSMutableArray alloc] initWithObjects:nameAndStateDic14,nameAndStateDic15, nil];
    
    NSMutableDictionary *nameAndStateDic16 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"大包",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic17 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"小林子",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic18 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"石头",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic19 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"小轩轩",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic20 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"阿东",@"name",@"NO",@"state",nil];
    
    grouparr4 = [[NSMutableArray alloc]initWithObjects:nameAndStateDic16,nameAndStateDic17,nameAndStateDic18,nameAndStateDic19,nameAndStateDic20, nil];
    
    NSMutableDictionary *nameAndStateDic21 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"郑平",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic22 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"刘凡",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic23 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"韩琴",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic24 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"刘华健",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic25 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"彭晓明",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic26 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"张欢",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic27 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"刘来楠",@"name",@"NO",@"state",nil];
    NSMutableDictionary *nameAndStateDic28 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",@"任强",@"name",@"NO",@"state",nil];
    
    grouparr5 = [[NSMutableArray alloc]initWithObjects:nameAndStateDic21,nameAndStateDic22,nameAndStateDic23,nameAndStateDic24,nameAndStateDic25,nameAndStateDic26,nameAndStateDic27,nameAndStateDic28, nil];
    
    [dic setValue:grouparr0 forKey:@"0"];
    [dic setValue:grouparr1 forKey:@"1"];
    [dic setValue:grouparr2 forKey:@"2"];
    [dic setValue:grouparr3 forKey:@"3"];
    [dic setValue:grouparr4 forKey:@"4"];
    [dic setValue:grouparr5 forKey:@"5"];
}

#pragma mark----tableViewDelegate
//返回几个表头
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleDataArray.count;
}

//每一个表头下返回几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *string = [NSString stringWithFormat:@"%d",section];
    
    if ([selectedArr containsObject:string]) {
        
        UIImageView *imageV = (UIImageView *)[_tableView viewWithTag:20000+section];
        imageV.image = [UIImage imageNamed:@"buddy_header_arrow_down@2x.png"];
        
        NSArray *array1 = dic[string];
        return array1.count;
    }
    return 0;
}

//设置表头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

//Section Footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.2;
}

//设置view，将替代titleForHeaderInSection方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, tableView.frame.size.width-20, 30)];
    titleLabel.text = [titleDataArray objectAtIndex:section];
    [view addSubview:titleLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 15, 15)];
    imageView.tag = 20000+section;

    //判断是不是选中状态
    NSString *string = [NSString stringWithFormat:@"%d",section];
    
    if ([selectedArr containsObject:string]) {
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_down@2x.png"];
    }
    else
    {
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_right@2x.png"];
    }
    [view addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 320, 40);
    button.tag = 100+section;
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, 320, 1)];
    lineImage.image = [UIImage imageNamed:@"line.png"];
    [view addSubview:lineImage];
   
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indexStr = [NSString stringWithFormat:@"%d",indexPath.section];
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"])
    {
        return 60;
    }
    else
        return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当前是第几个表头
    NSString *indexStr = [NSString stringWithFormat:@"%d",indexPath.section];
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"]) {
        
        static NSString *CellIdentifier = @"MainCell";
    
        MainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[MainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        
        if ([selectedArr containsObject:indexStr]) {
            cell.Headerphoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",arc4random()%11]];
            cell.nameLabel.text = dic[indexStr][indexPath.row][@"name"];
            cell.IntroductionLabel.text = @"他开着你的花，在每一个晚霞，靠着你的肩膀绣着枝桠";
            cell.networkLabel.text = @"2G";
        }
        
        if (indexPath.row == dataArray.count-1) {
            cell.imageLine.image = nil;
        }
        else
            cell.imageLine.image = [UIImage imageNamed:@"line.png"];
        
        return cell;
    }
    else if([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"AttachedCell"]){
        
        static NSString *CellIdentifier = @"AttachedCell";
        
        AttachedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell == nil) {
            cell = [[AttachedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.imageLine.image = [UIImage imageNamed:@"line.png"];

        }
        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *indexStr = [NSString stringWithFormat:@"%d",indexPath.section];
    
    NSIndexPath *path = nil;
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"]) {
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }
    else
    {
        path = indexPath;
    }
    
    if ([dic[indexStr][indexPath.row][@"state"] boolValue]) {
        
        // 关闭附加cell
        NSMutableDictionary *dd = dic[indexStr][indexPath.row];
        NSString *name = dd[@"name"];
        
        NSMutableDictionary *nameAndStateDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",name,@"name",@"NO",@"state",nil];
        
        switch (indexPath.section) {
            case 0:
            {
                grouparr0[(path.row-1)] = nameAndStateDic;
                [grouparr0 removeObjectAtIndex:path.row];
            }
                break;
            case 1:
            {
                grouparr1[(path.row-1)] = nameAndStateDic;
                [grouparr1 removeObjectAtIndex:path.row];
            }
                break;
            case 2:
            {
                grouparr2[(path.row-1)] = nameAndStateDic;
                [grouparr2 removeObjectAtIndex:path.row];
            }
                break;
            case 3:
            {
                grouparr3[(path.row-1)] = nameAndStateDic;
                [grouparr3 removeObjectAtIndex:path.row];
            }
                break;
            case 4:
            {
                grouparr4[(path.row-1)] = nameAndStateDic;
                [grouparr4 removeObjectAtIndex:path.row];
            }
                break;
            case 5:
            {
                grouparr5[(path.row-1)] = nameAndStateDic;
                [grouparr5 removeObjectAtIndex:path.row];
            }
                break;
                
            default:
                break;
        }
        
         [_tableView beginUpdates];
        [_tableView deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [_tableView endUpdates];
        
    }
    else
    {
        // 打开附加cell
        NSMutableDictionary *dd = dic[indexStr][indexPath.row];
        NSString *name = dd[@"name"];
        
        NSMutableDictionary *nameAndStateDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"MainCell",@"cell",name,@"name",@"YES",@"state",nil];

        switch (indexPath.section) {
            case 0:
            {
                grouparr0[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr0 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 1:
            {
                grouparr1[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr1 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 2:
            {
                grouparr2[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr2 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 3:
            {
                grouparr3[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr3 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 4:
            {
                grouparr4[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr4 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
            case 5:
            {
                grouparr5[(path.row-1)] = nameAndStateDic;
                NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"AttachedCell",@"cell",@"YES",@"state",nil];
                [grouparr5 insertObject:nameAndStateDic1 atIndex:path.row];
            }
                break;
                
            default:
                break;
        }
        
        [_tableView beginUpdates];
        [_tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [_tableView endUpdates];
        
    }
}

-(void)doButton:(UIButton *)sender
{
    NSString *string = [NSString stringWithFormat:@"%d",sender.tag-100];
    
    //数组selectedArr里面存的数据和表头想对应，方便以后做比较
    if ([selectedArr containsObject:string])
    {
        [selectedArr removeObject:string];
    }
    else
    {
        [selectedArr addObject:string];
    }
    
    [_tableView reloadData];
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
