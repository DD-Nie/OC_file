//
//  ViewController.m
//  SwithAlertsView
//
//  Created by nhz on 16/6/6.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "ViewController.h"

#import "LCAlertsListView.h"

#import "LCHeaderToolBar.h"

@interface ViewController ()

@property (nonatomic, strong)LCAlertsListView * list;
@property (nonatomic, strong) UIView * shotView;


@property (nonatomic, strong) UISwipeGestureRecognizer * leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer * rightSwipeGestureRecognizer;


@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect toolBarFrame = self.view.bounds;
    toolBarFrame.size.height = 40;
    toolBarFrame.origin.y = 64;
    
    LCHeaderToolBar * tool = [[LCHeaderToolBar alloc] initWithFrame:toolBarFrame];
    tool.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:tool];
    __weak typeof(self)weakSelf = self;
    [tool addTargetClick:^(LCHeaderToolBar *toolBar, ClickIndex index) {
        if (index == indexToday) {
            NSLog(@"点击了今天");
            
        }else if (index == indexDate) {
            NSLog(@"点击了日历");
        }else if (index == indexLeft) {
            NSLog(@"点击了向前翻页");
            [weakSelf clickLeft:toolBar];
        }else if (index == indexRight) {
            NSLog(@"点击了向后翻页");
            [weakSelf clickRight:toolBar];
        }
    }];
    
    LCAlertsListView * list = [[LCAlertsListView alloc] initWithFrame:CGRectMake(0,64 + toolBarFrame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - (64 + toolBarFrame.size.height))];
    self.list = list;
    [self.view addSubview:list];
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    
}

-(void)clickLeft:(LCHeaderToolBar *) toolBar{
    self.shotView = [self.list snapshotViewAfterScreenUpdates:NO];
    self.shotView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shotView.layer.shadowOffset = CGSizeMake(-5, 0);
    self.shotView.layer.shadowOpacity = 0.5f;
    CGRect oldFrame = self.list.frame;
    self.shotView.frame = oldFrame;
    [self.view addSubview:self.shotView];
    
    self.list.hidden = YES;
    [self.list removeFromSuperview];
    self.list = nil;
    
    //换成新的list
    self.list = [[LCAlertsListView alloc] initWithFrame:oldFrame];
    [self.view insertSubview:self.list atIndex:0];
//    [self.view addSubview:self.list];
    self.list.alpha = 0.5f;
    
    __weak typeof(self)weakSelf = self;
    
    [toolBar enableSubButtons:NO];
    
    [UIView animateWithDuration:0.3 delay:0.0f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        weakSelf.shotView.transform = CGAffineTransformMakeTranslation(weakSelf.shotView.bounds.size.width, 0);
        weakSelf.list.alpha = 1.0f;
        weakSelf.list.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0f];
    } completion:^(BOOL finished) {
        finished = YES;
        [toolBar enableSubButtons:YES];
        [weakSelf.shotView removeFromSuperview];
        weakSelf.shotView = nil;
    }];
    
    
//    CABasicAnimation *anima=[CABasicAnimation animation];
//    //1.1告诉系统要执行什么样的动画
//    anima.keyPath=@"position";
//    //设置通过动画，将layer从哪儿移动到哪儿
//    anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
//
//    //1.2设置动画执行完毕之后不删除动画
//    anima.removedOnCompletion=NO;
//    //1.3设置保存动画的最新状态
//    anima.fillMode=kCAFillModeForwards;
//    anima.delegate=self;
//
//   [self.shotView.layer addAnimation:anima forKey:nil];
    
//    [UIView animateWithDuration:0.45 animations:^{
    
//        CGRect newFrame = weakSelf.shotView.frame;
//        newFrame.origin.x = weakSelf.shotView.bounds.size.width;
//        weakSelf.shotView.frame = newFrame;
//        sender.enabled = NO;
//        
//        weakSelf.shotView.transform = CGAffineTransformMakeTranslation(weakSelf.shotView.bounds.size.width, 0);
//        weakSelf.list.alpha = 1.0f;
//        weakSelf.list.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0f];
//    } completion:^(BOOL finished) {
//        finished = YES;
//        [weakSelf.shotView removeFromSuperview];
//        weakSelf.shotView = nil;
//        sender.enabled = YES;
//    }];
    
    
    
}
-(void)clickRight:(LCHeaderToolBar *) toolBar{
    self.shotView = [self.list snapshotViewAfterScreenUpdates:NO];
    self.shotView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shotView.layer.shadowOffset = CGSizeMake(-5, 0);
    self.shotView.layer.shadowOpacity = 0.5f;
    CGRect oldFrame = self.list.frame;
    self.shotView.frame = oldFrame;
    [self.view addSubview:self.shotView];
    
    self.list.hidden = YES;
    [self.list removeFromSuperview];
    self.list = nil;
    
    //换成新的list
    self.list = [[LCAlertsListView alloc] initWithFrame:oldFrame];
    [self.view insertSubview:self.list atIndex:0];
//    [self.view addSubview:self.list];
    self.list.alpha = 0.7f;
    
    __weak typeof(self)weakSelf = self;
    [toolBar enableSubButtons:NO];

    [UIView animateWithDuration:0.3 animations:^{
//        CGRect newFrame = weakSelf.shotView.frame;
//        newFrame.origin.x = -weakSelf.shotView.bounds.size.width;
//        CGAffineTransform transform = CGAffineTransformIdentity;
        
        weakSelf.shotView.transform = CGAffineTransformMakeTranslation(-weakSelf.shotView.bounds.size.width, 0);
        
//        weakSelf.shotView.frame = newFrame;
        weakSelf.list.alpha = 1.0f;
        weakSelf.list.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0f];
    } completion:^(BOOL finished) {
        [weakSelf.shotView removeFromSuperview];
        weakSelf.shotView = nil;
        finished = YES;
        [toolBar enableSubButtons:YES];

    }];
}

-(void)enableButtons: (BOOL)enable{
    
    
    
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
//    CGPoint location = [sender locationInView:self.list];
    
    if(sender.state == UIGestureRecognizerStateChanged){
        
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
//        if (location.x > self.list.bounds.size.width - 50) {
            [self clickRight:self.rightButton];
//        }
        
        
//        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 100.0, self.swipeLabel.frame.origin.y);
//        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
//        self.swipeLabel.text = @"尼玛的, 你在往左边跑啊....";
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
//        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x + 100.0, self.swipeLabel.frame.origin.y);
//        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
//        self.swipeLabel.text = @"尼玛的, 你在往右边跑啊....";
        
//        if (location.x < 50) {
            [self clickLeft:self.leftButton];
//        }
        
        
    }
    
    
}

@end
