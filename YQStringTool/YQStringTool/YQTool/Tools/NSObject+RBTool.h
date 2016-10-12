//
//  NSObject+RBTool.h
//  Pudding
//
//  Created by zyqiong on 16/9/29.
//  Copyright © 2016年 Zhi Kuiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (RBTool)

@property (nonatomic,strong) UISlider * slider;

@property (nonatomic,assign) float currentVoiceValue;

/**
 是否是可变数组
 */
- (BOOL)mIsDictionary;
/**
 数据的键值对的个数
 */
- (NSUInteger)mCount;
/**
 根据key 获取object
 */
- (id)mObjectForKey:(id)aKey;

- (id)stringForKey:(id)aKey;


#pragma mark -  NSMutableDictionary

/**
 是否是可变数组
 */
- (BOOL)mIsMutableDictionary;
/**
 数据的键值对的个数
 */
- (void)mRemoveObjectForKey:(id)aKey;
/**
 设置key value 值
 
 */
- (void)mSetObject:(id)anObject forKey:(id <NSCopying>)aKey;


- (void)mSetValue:(id)value forKey:(NSString *)key ;


#pragma mark - NSArray

/**
 是否是数组
 */
- (BOOL)mIsArray;
#pragma mark - NSMutableArray

/**
 是否是可变数组
 */
- (BOOL)mIsMutableArray;
/**
 数据添加元素
 */
- (void)mAddObject:(id)anObject;
/**
 在index 索引上插入一个元素
 */
- (void)mInsertObject:(id)anObject atIndex:(int)index;
/**
 在index 索引上移除一个元素
 */
- (void)mRemoveObjectAtIndex:(int)index;
/**
 替换 index 元素
 */
- (void)mReplaceObjectAtIndex:(int)index withObject:(id)anObject;

/**
 获取index 上元素
 */
- (id)mObjectAtIndex:(NSUInteger)index;



#pragma mark - NSString

/**
 是否是string 类型
 */
- (BOOL)mIsStr;
/**
 获取string 的长度
 */
- (NSUInteger)mStrLength;


/**
 *  获取字符串的长度（中英文同一个单位）
 */
- (NSUInteger)mIntLength;
/**
 根据索引获取 char
 */
- (unichar)mCharAtIndex:(int)index;
/**
 根据 Range 获取 char *
 */
- (void)mGetCharacters:(unichar *)buffer range:(NSRange)aRange;
/**
 从form 截取后面的字符串
 */
- (NSString *)mSubstringFromIndex:(int)from;
/**
 截取字符串到 to 的索引
 */
- (NSString *)mSubstringToIndex:(int)to;
/**
 截取字符串 根据 Range
 */
- (NSString *)mSubstringWithRange:(NSRange)range;

/**
 *	@brief	判断是否存在对象字符
 */
- (BOOL) containsObjectCharacter;


#pragma mark - NSNumber
/**
 *  是NSNumber 类型 
 */
- (BOOL)mIsNum;
/**
 *  获取wifi信息
 */
- (NSDictionary *)fetchSSIDInfo;

/**
 *  旋转
 */
- (CGAffineTransform )transform:(NSInteger )orientation;
#pragma mark - 系统音量
/**
 *  改变系统音量到最大
 */
- (void)changeVoiceToMax:(UIView *)view;

/**
 *  重置到最开始系统音量
 */
- (void)resetToOldVoiceValue;

/**
 *  改变系统音量到progress
 */
- (void)changevoice:(float)progress;

@end
