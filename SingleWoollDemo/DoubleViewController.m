//
//  DoubleViewController.m
//  CLTreeViewDemo
//
//  Created by 钟由 on 14-9-9.
//  Copyright (c) 2014年 flywarrior24@163.com. All rights reserved.
//

#import "DoubleViewController.h"
#import "CLTree.h"

@interface DoubleViewController ()

@property(strong,nonatomic) NSMutableArray* dataArray; //保存全部数据的数组
@property(strong,nonatomic) NSArray *displayArray;   //保存要显示在界面上的数据的数组

@end

@implementation DoubleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myTableView = [[UITableView alloc]init];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    CGRect tableViewFrame = CGRectMake(0, 25, self.view.frame.size.width, self.view.frame.size.height);
    _myTableView.frame = tableViewFrame;
    [self.view addSubview:_myTableView];
    [self addTestData];//添加演示数据
    [self reloadDataForDisplayArray];//初始化将要显示的数据
}

//添加演示数据
-(void) addTestData{
    CLTreeViewNode *node3 = [[CLTreeViewNode alloc]init];
    node3.nodeLevel = 0;//根层cell
    node3.type = 1;//type 1的cell
    node3.sonNodes = nil;
    node3.isExpanded = FALSE;//关闭状态
    CLTreeView_LEVEL1_Model *tmp3 =[[CLTreeView_LEVEL1_Model alloc]init];
    tmp3.name = @"ios开发部门";
    tmp3.sonCnt = @"4";
    node3.nodeData = tmp3;
    
    CLTreeViewNode *node4 = [[CLTreeViewNode alloc]init];
    node4.nodeLevel = 0;
    node4.type = 1;
    node4.sonNodes = nil;
    node4.isExpanded = FALSE;
    CLTreeView_LEVEL1_Model *tmp4 =[[CLTreeView_LEVEL1_Model alloc]init];
    tmp4.name = @"安卓开发部门";
    tmp4.sonCnt = @"2";
    node4.nodeData = tmp4;
    
    CLTreeViewNode *node5 = [[CLTreeViewNode alloc]init];
    node5.nodeLevel = 1;//第一层节点
    node5.type = 2;//type 2的cell
    node5.sonNodes = nil;
    node5.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp5 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp5.name = @"flywarrior";
    tmp5.signture = @"老是失眠怎么办啊";
    tmp5.headImgPath = @"head1.jpg";
    tmp5.headImgUrl = nil;
    node5.nodeData = tmp5;
    
    CLTreeViewNode *node6 = [[CLTreeViewNode alloc]init];
    node6.nodeLevel = 1;
    node6.type = 2;
    node6.sonNodes = nil;
    node6.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp6 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp6.name = @"张三";
    tmp6.signture = @"把头用力撞向键盘就能治好了。。";
    tmp6.headImgPath = @"head2.jpg";
    tmp6.headImgUrl = nil;
    node6.nodeData = tmp6;
    
    CLTreeViewNode *node7 = [[CLTreeViewNode alloc]init];
    node7.nodeLevel = 1;
    node7.type = 2;
    node7.sonNodes = nil;
    node7.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp7 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp7.name = @"李四";
    tmp7.signture = @"说的好有道理，我竟无言以对。";
    tmp7.headImgPath = @"head3.jpg";
    tmp7.headImgUrl = nil;
    node7.nodeData = tmp7;
    
    CLTreeViewNode *node8 = [[CLTreeViewNode alloc]init];
    node8.nodeLevel = 1;
    node8.type = 2;
    node8.sonNodes = nil;
    node8.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp8 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp8.name = @"田七";
    tmp8.signture = @"肚子好饿啊。。。";
    tmp8.headImgPath = @"head4.jpg";
    tmp8.headImgUrl = nil;
    node8.nodeData = tmp8;
    
    CLTreeViewNode *node9 = [[CLTreeViewNode alloc]init];
    node9.nodeLevel = 1;
    node9.type = 2;
    node9.sonNodes = nil;
    node9.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp9 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp9.name = @"王大锤";
    tmp9.signture = @"走向人生巅峰！";
    tmp9.headImgPath = @"head5.jpg";
    tmp9.headImgUrl = nil;
    node9.nodeData = tmp9;
    
    CLTreeViewNode *node0 = [[CLTreeViewNode alloc]init];
    node0.nodeLevel = 1;
    node0.type = 2;
    node0.sonNodes = nil;
    node0.isExpanded = FALSE;
    CLTreeView_LEVEL2_Model *tmp0 =[[CLTreeView_LEVEL2_Model alloc]init];
    tmp0.name = @"孔连顺";
    tmp0.signture = @"锤锤。。。";
    tmp0.headImgPath = @"head6.jpg";
    tmp0.headImgUrl = nil;
    node0.nodeData = tmp0;

    node3.sonNodes = [NSMutableArray arrayWithObjects:node5,node6,node7,node8,nil];//插入子节点
    node4.sonNodes = [NSMutableArray arrayWithObjects:node9,node0,nil];
    _dataArray = [NSMutableArray arrayWithObjects:node3,node4, nil];//插入到元数据数组
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return _displayArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"level0cell";
    static NSString *indentifier1 = @"level1cell";
    static NSString *indentifier2 = @"level2cell";
    CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    if(node.type == 0){//类型为0的cell
        CLTreeView_LEVEL0_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level0_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node];//重新给cell装载数据
        [cell setNeedsDisplay]; //重新描绘cell
        return cell;
    }
    else if(node.type == 1){//类型为1的cell
        CLTreeView_LEVEL1_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier1];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level1_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node];
        [cell setNeedsDisplay];
        return cell;
    }
    else{//类型为2的cell
        CLTreeView_LEVEL2_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier2];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Level2_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node];
        [cell setNeedsDisplay];
        return cell;
    }
}

/*---------------------------------------
 为不同类型cell填充数据
 --------------------------------------- */
-(void) loadDataForTreeViewCell:(UITableViewCell*)cell with:(CLTreeViewNode*)node{
    if(node.type == 0){
        CLTreeView_LEVEL0_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL0_Cell*)cell).name.text = nodeData.name;
        if(nodeData.headImgPath != nil){
            //本地图片
            [((CLTreeView_LEVEL0_Cell*)cell).imageView setImage:[UIImage imageNamed:nodeData.headImgPath]];
        }
        else if (nodeData.headImgUrl != nil){
            //加载图片，这里是同步操作。建议使用SDWebImage异步加载图片
            [((CLTreeView_LEVEL0_Cell*)cell).imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:nodeData.headImgUrl]]];
        }
    }
    
    else if(node.type == 1){
        CLTreeView_LEVEL1_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL1_Cell*)cell).name.text = nodeData.name;
        ((CLTreeView_LEVEL1_Cell*)cell).sonCount.text = nodeData.sonCnt;
    }
    
    else{
        CLTreeView_LEVEL2_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL2_Cell*)cell).name.text = nodeData.name;
        ((CLTreeView_LEVEL2_Cell*)cell).signture.text = nodeData.signture;
        if(nodeData.headImgPath != nil){
            //本地图片
            [((CLTreeView_LEVEL2_Cell*)cell).headImg setImage:[UIImage imageNamed:nodeData.headImgPath]];
        }
        else if (nodeData.headImgUrl != nil){
            //加载图片，这里是同步操作。建议使用SDWebImage异步加载图片
            [((CLTreeView_LEVEL2_Cell*)cell).headImg setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:nodeData.headImgUrl]]];
        }
    }
}

/*---------------------------------------
 cell高度默认为50
 --------------------------------------- */
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 50;
}

/*---------------------------------------
 处理cell选中事件，需要自定义的部分
 --------------------------------------- */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    [self reloadDataForDisplayArrayChangeAt:indexPath.row];//修改cell的状态(关闭或打开)
    if(node.type == 2){
        //处理叶子节点选中，此处需要自定义
    }
    else{
        CLTreeView_LEVEL0_Cell *cell = (CLTreeView_LEVEL0_Cell*)[tableView cellForRowAtIndexPath:indexPath];
        if(cell.node.isExpanded ){
            [self rotateArrow:cell with:M_PI_2];
        }
        else{
            [self rotateArrow:cell with:0];
        }
    }
}

/*---------------------------------------
 旋转箭头图标
 --------------------------------------- */
-(void) rotateArrow:(CLTreeView_LEVEL0_Cell*) cell with:(double)degree{
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        cell.arrowView.layer.transform = CATransform3DMakeRotation(degree, 0, 0, 1);
    } completion:NULL];
}

/*---------------------------------------
 初始化将要显示的cell的数据
 --------------------------------------- */
-(void) reloadDataForDisplayArray{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.myTableView reloadData];
}

/*---------------------------------------
 修改cell的状态(关闭或打开)
 --------------------------------------- */
-(void) reloadDataForDisplayArrayChangeAt:(NSInteger)row{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    NSInteger cnt=0;
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(cnt == row){
            node.isExpanded = !node.isExpanded;
        }
        ++cnt;
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(cnt == row){
                    node2.isExpanded = !node2.isExpanded;
                }
                ++cnt;
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                        ++cnt;
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.myTableView reloadData];
}
@end


// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
