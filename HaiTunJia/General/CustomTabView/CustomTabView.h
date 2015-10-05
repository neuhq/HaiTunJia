//
//  FinancialSecHeadView.h
//  JDMobile
//
//  Created by wangxiugang on 14-5-22.
//  Copyright (c) 2014年 wangxiugang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabView : UIView

@property (nonatomic, assign)   NSInteger index;

/*!
 * @author 15-03-19 10:03:23  李哲
 *
 * @brief  初始化控件
 *
 * @param delegate delegate
 * @param arr      文本数组
 *
 * @return
 *
 * @since
 */
- (id)initWithDlegate:(id)delegate withArr:(NSArray*)arr;

/*!
 * @author 15-03-19 10:03:32  李哲
 *
 * @brief  改变文本
 *
 * @param string string description
 * @param index  index description
 *
 * @since version number 2.2.0
 */
- (void)reload:(NSString*)string withIndex:(NSInteger)index;

- (void)reload:(NSArray*)arr;

/*!
 * @author 15-03-19 10:03:11  lizhe
 *
 * @brief  改变控件背景颜色
 *
 * @param color       color description
 * @param isHidenLine 是否隐藏移动线
 *
 * @since version number 2.2.0
 */
-(void)changeSelfBgViewColor:(UIColor *) color
                 isHidenLine:(BOOL) isHidenLine
                  labelCount:(NSInteger) labelCount;

//控件背景颜色
@property(nonatomic,strong) UIView *bgView;

//文本数组
@property(nonatomic,strong) NSMutableArray *labelArray;

//移动线 //红色底线
@property(nonatomic,strong) UILabel *lineLabel;

@end

@protocol CustomTabViewDelegete <NSObject>

@optional

- (void)tapIndex:(NSInteger)index;

@end
