//
//  HomeTableVC.m
//  DemoTriggerAT
//
//  Created by k2annex on 15/05/18.
//  Copyright © 2018 actv8me. All rights reserved.
//

#import "HomeTableVC.h"
#import "HomeTableCell.h"
#import "DetailHomeVC.h"
#import "AudioModel.h"


@interface HomeTableVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableHomeOffers;


@end

@implementation HomeTableVC
@synthesize arrParsedData;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHomeOffers.delegate = self;
    self.tableHomeOffers.dataSource = self;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:173.0/255.0 blue:0.0/255.0 alpha:1.0]];
    self.title = @"Offer";
  
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    

    // Do any additional setup after loading the view.
}

//Table implementation Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Here, for each section, you must return the number of rows it will contain
    
    return arrParsedData.count;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *cellIdentifier = @"HomeTableCell";
    
    HomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[HomeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell bindCellData:[arrParsedData objectAtIndex:indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AudioModel *selectedModel = [arrParsedData objectAtIndex:indexPath.row];
    DetailHomeVC *detailVC = (DetailHomeVC *)[self.storyboard instantiateViewControllerWithIdentifier:@"DetailHomeVC"];
    detailVC.objSelectedModel = selectedModel;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
