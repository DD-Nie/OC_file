//
//  LCAlertsListView.m
//  SwithAlertsView
//
//  Created by nhz on 16/6/6.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCAlertsListView.h"
#import "LCAlertCollectionViewCell.h"

#import "LCAlertCell.h"

#import "AnimatorView.h"

#import "LCAlertDefine.h"

#import "LCHeaderView.h"

//#import "LCAddAlertViewController.h"


@interface LCAlertsListView()<LCAlertCellDelegate>

@property (nonatomic, strong) NSIndexPath * selectedIndexPath;

@end

@implementation LCAlertsListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createListView];
    }
    return self;
}
-(void)createListView{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    self.collectionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.collectionView registerClass:[LCAlertCell class] forCellWithReuseIdentifier:@"LCAlertCell"];
    
    [self.collectionView registerClass:[LCHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LCHeaderView headerIdentifier]];
    
    [self addSubview:self.collectionView];
    
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"LCAlertCell";
    LCAlertCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath == self.selectedIndexPath) {
        cell.noAnimaSelected = YES;
    }else{
        cell.noAnimaSelected = NO;
    }
    cell.delegate = self;
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == self.selectedIndexPath) {
        return CGSizeMake(self.bounds.size.width - 20, kAlertCellHeight + kAlertCellBackViewHeight);
    }
    return CGSizeMake(self.bounds.size.width - 20, kAlertCellHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 15, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.bounds.size.width, 40);
}

#pragma mark --UICollectionViewDelegate

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    LCHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[LCHeaderView headerIdentifier] forIndexPath:indexPath];
    headerView.leftLabel.text = @"今天";
    headerView.rightLabel.text = @"06月09日 星期三";
    return headerView;
}



-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    LCAlertCell * cell = (LCAlertCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.animaSelected = NO;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView performBatchUpdates:^{
        
        LCAlertCell * cell = (LCAlertCell *)[collectionView cellForItemAtIndexPath:indexPath];
        
        if (self.selectedIndexPath != indexPath) {
            self.selectedIndexPath = indexPath;
            
            cell.animaSelected = YES;
            [collectionView reloadInputViews];
        }else{
            self.selectedIndexPath = nil;
            cell.animaSelected = NO;
            [collectionView reloadInputViews];
            
        }
        
    } completion:^(BOOL finished) {
        finished = YES;
    }];
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark -
#pragma mark - LCAlertDelegate
-(void)LCAlertCellDidClickEditBtn:(LCAlertCell *)cell{
//    LCAddAlertViewController * addAlert = [[LCAddAlertViewController alloc] init];
//    [self presentViewController:addAlert animated:YES completion:nil];
}

@end
