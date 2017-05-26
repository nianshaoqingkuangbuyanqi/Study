//
//  LQSystemFontDeatilNameVCL.m
//  Study
//
//  Created by mayibailing1 on 2017/5/26.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQSystemFontDeatilNameVCL.h"

@interface LQSystemFontDeatilNameVCL ()

@end

@implementation LQSystemFontDeatilNameVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
    [self initData];
    
    //设置title
    self.title = @"字体名称";
    
    //添加返回按钮
    [self addBackButton];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化数据

- (void)initData
{
    [self.dataArray addObjectsFromArray:[UIFont fontNamesForFamilyName:self.params[@"name"]]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [self createTableViewCellWithTableView:tableView CellIdentifier:identifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
//    cell.textLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@.%@",self.params[@"name"],self.dataArray[indexPath.row]] size:17];
    cell.textLabel.font = [UIFont fontWithName:self.dataArray[indexPath.row] size:17];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
