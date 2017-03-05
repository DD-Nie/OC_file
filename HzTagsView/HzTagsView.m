//
//  HzTagsView.m
//  HzTagViews
//
//  Created by nhz on 16/3/27.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzTagsView.h"

#import "HzTagCollectionViewCell.h"
#import "HzTagsHeaderView.h"

#define kIdentityTagCellIdentifier @"IdentityTagCellIdentifier"
#define kIdentityTagHeaderViewIdentifier @"IdentityTagHeaderViewIdentifier"

#define kSectionPadding 50

@interface HzTagsView()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * sectionDiseaseHistoryArr;
@property (nonatomic, strong) NSMutableArray * sectionAllergyHistoryArr;
@property (nonatomic, strong) UICollectionViewFlowLayout * myLayout;
//@property (nonatomic, strong) HzTagsViewConfig * config;

@end

@implementation HzTagsView


- (instancetype)initWithFrame:(CGRect)frame config:(HzTagsViewConfig *)config{
    self = [super initWithFrame:frame];
    if (self) {
        self.config = config;
        [self configArrData];
        [self configViews];
    }
    return self;
}

-(void)setConfig:(HzTagsViewConfig *)config{
    if (_config != config) {
        _config = config;
    }
    [self configViews];
    //必须先调用configViews
    [self configArrData];
    [self updateFrame];
}

-(CGFloat)updateFrame{
    CGRect oldFrame = self.collectionView.frame;
    oldFrame.size.height = self.myLayout.collectionViewContentSize.height;
    self.collectionView.frame = oldFrame;
    return self.myLayout.collectionViewContentSize.height;
}

-(CGFloat)contentHeight{
    return self.myLayout.collectionViewContentSize.height;
}

-(void)configArrData{
    NSMutableArray * sections = _config.sectionsArr;
    for (int i=0 ; i< sections.count; i++) {
        NSMutableArray * section = sections[i];
        for (int j =0 ; j< section.count; j++) {
            section[j] = [self cutString:section[j]];
        }
    }
}

-(NSString *)cutString:(NSString *)str{
    NSMutableString * mutStr = [NSMutableString stringWithString:str];
    if (str.length > 10) {
        for (int i = 1 ; i < (str.length/10) + 1; i++) {
            [mutStr insertString:@"\n" atIndex:i*10];
        }
    }
    return [NSString stringWithString:mutStr];
}

-(void)configViews{
    
    //设置CollectionView
    
    if (!self.myLayout) {
        self.myLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    if (!self.collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, MIN([UIScreen mainScreen].bounds.size.width, self.frame.size.width), self.frame.size.height) collectionViewLayout:self.myLayout];
    }
    
    [self.collectionView registerClass:[HzTagCollectionViewCell class] forCellWithReuseIdentifier:kIdentityTagCellIdentifier];
    [self.collectionView registerClass:[HzTagsHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kIdentityTagHeaderViewIdentifier];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
}
#pragma mark - UICollectionViewDelegate

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize resultSize = CGSizeZero;
    
    resultSize = ([(NSString *)[((NSMutableArray *)_config.sectionsArr[indexPath.section]) objectAtIndex:indexPath.row] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}]);
    
    return CGSizeMake( MAX(resultSize.width, 40), resultSize.height);
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.frame.size.width, 10);
}


//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//
//
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return MIN(_config.sectionsArr.count, _config.sectionsTitle.count) ;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = ((NSMutableArray *)_config.sectionsArr[section]).count;
    return count;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HzTagsHeaderView * headerView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kIdentityTagHeaderViewIdentifier forIndexPath:indexPath];
        headerView.headerIndexPath = indexPath;
    }
    headerView.nameLabel.text = _config.sectionsTitle[indexPath.section];
    
    return headerView;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UINib *nib = [UINib nibWithNibName:@"HzTagCollectionViewCell" bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:kIdentityTagCellIdentifier];
    HzTagCollectionViewCell * cell = [cv dequeueReusableCellWithReuseIdentifier:kIdentityTagCellIdentifier forIndexPath:indexPath];
    if (_config.tagCornerRadius > 0) {
        cell.layer.cornerRadius = _config.tagCornerRadius;
    }else{
        cell.layer.cornerRadius = cell.bounds.size.height * 0.5;
    }
    if (_config.tagBackColor) {
        cell.backgroundColor = _config.tagBackColor;
    }else{
        cell.backgroundColor = [UIColor colorWithRed:0.3 green:0.9 blue:0.3 alpha:1.0];
    }
    cell.layer.masksToBounds = YES;
    cell.textLabel.text = ((NSMutableArray *)_config.sectionsArr[indexPath.section])[indexPath.row];
    if (_config.tagTextColor) {
        cell.textLabel.textColor = _config.tagTextColor;
    }
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return MAX(_config.minimumInteritemSpacing, 3.0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return MAX(_config.minimumLineSpacing, 3.0);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(MAX(_config.PaddingOfTop, 0), MAX(_config.PaddingOfLetf, 0), MAX(_config.PaddingOfBottom, 0), MAX(_config.PaddingOfRight, 0));
}


@end
