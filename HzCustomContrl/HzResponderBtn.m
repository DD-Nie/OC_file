//
//  HzResponderBtn.m
//  play
//
//  Created by nhz on 16/1/25.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzResponderBtn.h"
#import "UIView+frameAdjust.h"
#import "NHZ.h"

#import "NSString+Extension.h"

@interface HzResponderBtn ()

@property (nonatomic, strong) NSMutableArray * yearArray;
@property (nonatomic, strong) NSMutableArray * monthArray;
@property (nonatomic, strong) NSMutableArray * dayArray;

@property (nonatomic, copy) NSString *  selectedYear;
@property (nonatomic, copy) NSString *  selectedMonth;
@property (nonatomic, copy) NSString *  selectedDay;
@property (nonatomic, copy) NSString * selectedTitle;

//记录刚进入时的时间
@property (nonatomic, copy) NSString * originDate;

@end

@implementation HzResponderBtn



-(NSMutableArray *)yearArray{
    if (!_yearArray) {
        _yearArray = [[NSMutableArray alloc] init];
        for (int i = 1970; i <= 2016 ; i++)
        {
            [_yearArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _yearArray;
}
-(NSMutableArray *)monthArray{
    if (!_monthArray) {
        _monthArray = [NSMutableArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",nil];
    }
    return _monthArray;
}

-(NSMutableArray *)dayArray{
    if (!_dayArray) {
        _dayArray = [NSMutableArray arrayWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09", nil];
        for (int i = 10 ; i<=31; i++) {
            [_dayArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _dayArray;
}


-(UIView *)inputAccessoryView{
     if(!_inputAccessoryView) {
         
         UIView * inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
         inputAccessoryView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
         UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
         [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
         [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
         cancelBtn.frame = CGRectMake(0, 0, 60, 44);
         [inputAccessoryView addSubview:cancelBtn];
         
         UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         confirmBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, 0, 60, 44);
         [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
         [confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
         [confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
         [inputAccessoryView addSubview:confirmBtn];
         inputAccessoryView.userInteractionEnabled = YES;
         
         self.originDate = self.titleLabel.text;

         
         return inputAccessoryView;
         
//         UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//         toolBar.backgroundColor = [UIColor whiteColor];
//        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItem target:self action:@selector(dodo)];
//         UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(dodo)];
//         right.title = @"确定";
//         toolBar.items = [NSArray arrayWithObject:right];
//         UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dodo)];
//          toolBar.items = [NSArray arrayWithObjects:right, left, nil];
//          return toolBar;
        }
    self.originDate = self.titleLabel.text;
    return _inputAccessoryView;
}
 -(UIPickerView *)inputView
{
     if(!_inputView)
   {
       UIPickerView *  pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
       pickView.backgroundColor = [UIColor whiteColor];
       pickView.delegate =self;
       pickView.dataSource = self;
       pickView.showsSelectionIndicator = YES;
       [self fillPickerData:pickView];
       return pickView;
   }
   return _inputView;
}

-(void)fillPickerData:(UIPickerView *)pickView{
    
    if (self.titleLabel.text.length <= [NSString stringWithFormat:@"信息缺失"].length) {
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        [self setTitle:[NSString trslateDateFormateHorizontalLinetoBackslash:dateString] forState:UIControlStateNormal];
        NSLog(@"%@", self.titleLabel.text);
    }
    
    NSString * date = self.titleLabel.text;
    NSArray * dateArr = [date componentsSeparatedByString:@" / "];
    int year = [dateArr[0] intValue];
    int month = [dateArr[1] intValue] - 1;
    int day = [dateArr[2] intValue] - 1;
    
    int yearNumber = year - 1970;
    
    [pickView rowSizeForComponent:2];
    pickView.showsSelectionIndicator = NO;
    [pickView selectRow:yearNumber inComponent:0 animated:YES];
    self.selectedYear =  _yearArray[yearNumber];
    [pickView selectRow:month inComponent:1 animated:NO];
    self.selectedMonth = _monthArray[month];
    [pickView selectRow:day inComponent:2 animated:NO];
    self.selectedDay = _dayArray[day];
}
#pragma mark - 取消确定按钮响应函数
-(void)cancelBtnClick:(UIButton *)sender{
    [self resignFirstResponder];
    
    [self.delegate hz_responderBtn:self accessoryViewSelectConfirm:self.originDate];
//    [self.delegate hz_responderBtnAccessoryViewSelectCancel:self];
}
-(void)confirmBtnClick:(UIButton *)sender{
    [self resignFirstResponder];
    if (!self.selectedTitle) {
        self.selectedTitle = self.titleLabel.text;
    }
    [self.delegate hz_responderBtn:self accessoryViewSelectConfirm:self.selectedTitle];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

#pragma mark - PickerViewDelegate

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 1) {
        return 65;
    }else if (component == 2){
        return 80;
    }
    return 320/3;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    
//    NSLog(@"%@", view);
//    
//    if (!view) {
//        view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320/3, 30)];
//    }
//    UILabel * label = (UILabel *)view;
//    if (component == 0) {
//        label.text = self.yearArray[row];
//        label.textAlignment = NSTextAlignmentRight;
//    }else if (component == 1){
//        label.text = self.monthArray[row];
//        label.textAlignment = NSTextAlignmentCenter;
//    }else if (component == 2){
//        label.text = self.dayArray[row];
//        label.textAlignment = NSTextAlignmentLeft;
//    }
//    label.backgroundColor = [UIColor clearColor];
//    return label;
//}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        self.selectedYear =_yearArray[row];
    } else if (component == 1){
        self.selectedMonth =_monthArray[row];
    }else if (component == 2){
        self.selectedDay =_dayArray[row];
    }
    self.selectedTitle = [NSString stringWithFormat:@"%@ / %@ / %@", self.selectedYear, self.selectedMonth, self.selectedDay];
    [self setTitle:self.selectedTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_yearArray[row] stringByAppendingString:@"年"];
    }else if (component == 1){
        return [_monthArray[row] stringByAppendingString:@"月"];
    }else if (component == 2){
        return [_dayArray[row] stringByAppendingString:@"日"];
    }
    return [NSString stringWithFormat:@"%ld",(long)row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.yearArray.count;
    }else if (component == 1){
        return self.monthArray.count;
    }else if (component == 2){
        return self.dayArray.count;
    }
    return 0;
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}


@end
