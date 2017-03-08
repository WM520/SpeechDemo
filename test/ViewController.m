//
//  ViewController.m
//  test
//
//  Created by foreverlove on 17/3/6.
//  Copyright © 2017年 foreverlove. All rights reserved.
//

#import "ViewController.h"
#import "THSpeechController.h"
#import "THBubbleCell.h"
#import "THBubbleCellLeft.h"

static NSString * const THBubbleCellID = @"bubblecell";
static NSString * const THBubbleCellLeftID = @"bubblecellleft";

@interface ViewController ()<UITableViewDelegate,
                            UITableViewDataSource,
                            AVSpeechSynthesizerDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *speechArray;

@end

@implementation ViewController

#pragma mark -lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:@"THBubbleCell" bundle:nil] forCellReuseIdentifier:THBubbleCellID];
        [tableView registerNib:[UINib nibWithNibName:@"THBubbleCellLeft" bundle:nil] forCellReuseIdentifier:THBubbleCellLeftID];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)speechArray
{
    if (!_speechArray) {
        _speechArray = [NSMutableArray array];
    }
    return _speechArray;
}

#pragma mark -lifestyle
- (void)viewDidLoad {
    [super viewDidLoad];
    THSpeechController *th = [THSpeechController speechcontroller];
    th.synthesizer.delegate = self;
    [th beginConversation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.speechArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = indexPath.row % 2 == 0 ? THBubbleCellID : THBubbleCellLeftID;
    THBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.speechString.text = self.speechArray[indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark -AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
    [self.speechArray addObject:utterance.speechString];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.speechArray.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
