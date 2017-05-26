//
//  LQSystemFontNameVCL.m
//  Study
//
//  Created by mayibailing1 on 2017/5/25.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQSystemFontNameVCL.h"
#import "LQSystemFontDeatilNameVCL.h"


@interface LQSystemFontNameVCL ()

@end

@implementation LQSystemFontNameVCL

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
    [self.dataArray addObjectsFromArray:[UIFont familyNames]];
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQSystemFontDeatilNameVCL *detail = [[LQSystemFontDeatilNameVCL alloc] init];
    detail.params = @{@"name":self.dataArray[indexPath.row]};
    [self.navigationController pushViewController:detail animated:YES];
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
