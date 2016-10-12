//
//  NSObject+RBTool.m
//  Pudding
//
//  Created by zyqiong on 16/9/29.
//  Copyright © 2016年 Zhi Kuiyu. All rights reserved.
//

#import "NSObject+RBTool.h"
#import <objc/runtime.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation NSObject (RBTool)
@dynamic currentVoiceValue;
@dynamic slider;
#pragma mark - Dictionary

/**  
 根据key 获取object
 */
- (id)mObjectForKey:(id)aKey
{
    id object = nil;
    
    if([self mIsDictionary] || [self isKindOfClass:[NSUserDefaults class]]){
        object = [(NSDictionary *)self objectForKey:aKey];
        
    }
    
    return object;
}

- (id)stringForKey:(id)aKey
{
    id object = @"";
    
    if([self mIsDictionary] && aKey!= nil && ![aKey isKindOfClass:[NSNull class]]) {
        
        NSString *string = [(NSDictionary *)self objectForKey: aKey];
        object = string && [string isKindOfClass: [NSString class]] && [string length] > 0 ? string : @"";
    }
    return object;
}

/**  
 是否是可变数组
 */
- (BOOL)mIsDictionary{
    if([self isKindOfClass:[NSDictionary class]] && self != nil){
        return YES;
    }
    return NO;
}
/**  
 数据的键值对的个数 和数组的长度
 */
- (NSUInteger)mCount
{
    if([self mIsDictionary]){
        return [(NSDictionary *)self count];
    }
    if([self mIsArray]){
        return [(NSArray *)self count];
    }
    return 0;
    
}

#pragma - mark NSMutableDictionary
/**  
 是否是可变数组
 */
- (BOOL)mIsMutableDictionary{
    if([self isKindOfClass:[NSMutableDictionary class]] && self != nil){
        return YES;
    }
    return NO;
}

/**  
 根据key 移除键值对
 */
- (void)mRemoveObjectForKey:(id)aKey
{
    if(aKey != nil && ![aKey isKindOfClass:[NSNull class]] && [self mIsMutableDictionary]){
        [(NSMutableDictionary *)self removeObjectForKey:aKey];
    }
    
}
/**  
 设置key value 值
 
 */
- (void)mSetObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if(anObject != nil  && ![anObject isKindOfClass:[NSNull class]] && aKey != nil && [self mIsMutableDictionary]){
        [(NSMutableDictionary *)self setObject:anObject forKey:aKey];
    }
}

- (void)mSetValue:(id)value forKey:(NSString *)key{
    if(value != nil && key != nil && [self mIsMutableDictionary]){
        [self setValue:value forKey:key];
    }
}

#pragma mark - NSArray


/**  
 是否是可变数组
 */
- (BOOL)mIsArray{
    if([self isKindOfClass:[NSArray class]] && self != nil){
        return YES;
    }
    return NO;
    
}


/**  
 获取index 上元素
 */
- (id)mObjectAtIndex:(NSUInteger)index
{
    if([self mIsArray] && index < [self mCount]){
        return [(NSArray *)self objectAtIndex:index];
    }
    return nil;
    
}


#pragma mark - NSMutableArray

/**  
 是否是可变数组
 */
- (BOOL)mIsMutableArray{
    if([self isKindOfClass:[NSMutableArray class]] && self != nil){
        return YES;
    }
    return NO;
    
}

/**  
 数据添加元素
 */
- (void)mAddObject:(id)anObject
{
    if([self mIsMutableArray] && self != nil && anObject != nil && ![anObject isKindOfClass:[NSNull class]] ){
        [(NSMutableArray *)self addObject:anObject];
    }
}

/**  
 在index 索引上插入一个元素
 */
- (void)mInsertObject:(id)anObject atIndex:(int)index
{
    if([self mIsMutableArray] && index >=0 && index <= [self mCount]  && anObject != nil && ![anObject isKindOfClass:[NSNull class]]){
        [(NSMutableArray *)self insertObject:anObject atIndex:index];
    } else
        NSLog(@"---------------- insertObject error %@ at index %d",anObject ,index);
}
/**  
 在index 索引上移除一个元素
 */
- (void)mRemoveObjectAtIndex:(int)index
{
    if([self mIsMutableArray] && index >=0 && index < [self mCount]){
        [(NSMutableArray *)self removeObjectAtIndex:index];
    }else
        NSLog(@"---------------- mRemoveObjectAtIndex error at index %d" ,index);
    
}
/**  
 替换 index 元素
 */
- (void)mReplaceObjectAtIndex:(int)index withObject:(id)anObject
{
    if([self mIsMutableArray] && index >=0 && index < [self mCount] && anObject != nil && ![anObject isKindOfClass:[NSNull class]]){
        
        [(NSMutableArray *)self replaceObjectAtIndex:index withObject:anObject];
    }else
        NSLog(@"---------------- insertObject error %@ at index %d",anObject ,index);
}


#pragma  mark - NSString


/**  
 是否是string 类型
 */
- (BOOL)mIsStr
{
    if([self isKindOfClass:[NSString class]] && self != nil){
        return YES;
    }
    return NO;
}
/**  
 获取string 的长度
 */
- (NSUInteger)mStrLength
{
    if([self mIsStr]){
        return [(NSString *)self length];
    }
    return 0;
    
}

/**
 *  获取字符串的长度
 */
- (NSUInteger)mIntLength
{
    NSInteger len = [(NSString*)self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    
    return len/2;
}

/**  
 根据索引获取 char
 */
- (unichar)mCharAtIndex:(int)index{
    if(index >= 0 && index < [self mStrLength]){
        return [(NSString *)self characterAtIndex:index];
    }
    return 0;
}


/**  
 根据 Range 获取 char *
 */
- (void)mGetCharacters:(unichar *)buffer range:(NSRange)aRange{
    if([self mStrLength] > (aRange.length + aRange.location)){
        [(NSString *)self getCharacters:buffer range:aRange];
    }
}

/**  
 从form 截取后面的字符串
 */
- (NSString *)mSubstringFromIndex:(int)from{
    if([self mStrLength] > from && from >= 0){
        return [(NSString *)self substringFromIndex:from];
    }
    return nil;
}
/**  
 截取字符串到 to 的索引
 */
- (NSString *)mSubstringToIndex:(int)to{
    if([self mStrLength] >= to && to > 0){
        return [(NSString *)self substringToIndex:to];
    }
    return nil;
    
}
/**  
  截取字符串 根据 Range
 */
- (NSString *)mSubstringWithRange:(NSRange)range{
    if([self mStrLength] >= (range.length + range.location)){
        return [(NSString *)self substringWithRange:range];
    }
    return nil;
}

/**
 *	判断是否存在对象字符
 */
- (BOOL) containsObjectCharacter {
    
    if (![self isKindOfClass: [NSString class]])
        return NO;
    
    int index = 0;
    NSString *string = (NSString *) self;
    while (index < [string length]) {
        
        NSString *character = [string substringWithRange: NSMakeRange(index, 1)];
        if ([character lengthOfBytesUsingEncoding: NSUTF8StringEncoding] == 3)
            return YES;
        index++;
    }
    
    return NO;
}

/**
 *  是否是NSNumber类型
 */
- (BOOL)mIsNum{
    if([self isKindOfClass:[NSNumber class]] && self != nil){
        return YES;
    }
    return NO;
    
}
#pragma - mark 获取wifi信息
- (NSDictionary *)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    if([[info allKeys] count] > 0){
        info = [self resetMacAddress:info];
    }
    
    return info ;
    
}
- (id)resetMacAddress:(NSDictionary *) dict{
    NSString * macAddress = [dict mObjectForKey:@"BSSID"];
    NSArray * array = [macAddress componentsSeparatedByString:@":"];
    
    NSMutableString * string = [NSMutableString new] ;
    for(int i = 0 ; i < array.count ; i++){
        NSString * str = [array objectAtIndex:i];
        if(str.length == 1){
            str = [NSString stringWithFormat:@"0%@",str];
        }
        if(i < (array.count - 1)){
            [string appendFormat:@"%@:",str];
        }else{
            [string appendFormat:@"%@",str];
        }
        
    }
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] initWithDictionary:dict];
    [dic setObject:string forKey:@"BSSID"];
    return dic;
    
}
#pragma - mark 旋转
- (CGAffineTransform )transform:(NSInteger )orientation{
    CGAffineTransform transform = CGAffineTransformIdentity;
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        transform =  CGAffineTransformMakeRotation(M_PI*1.5);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        transform = CGAffineTransformMakeRotation(M_PI/2);
    }else{
        transform = CGAffineTransformIdentity;
    }
    return transform;
}

#pragma - mark 改变系统音量
- (UISlider *)slider{
    return objc_getAssociatedObject(self, @"slider");
}

- (void)setSlider:(UISlider *)slider{
    objc_setAssociatedObject(self, @"slider", slider, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setCurrentVoiceValue:(float)currentVoiceValue{
    objc_setAssociatedObject(self, @"currentVoiceValue", @(currentVoiceValue), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (float)currentVoiceValue{
    return [objc_getAssociatedObject(self, @"currentVoiceValue") floatValue];
}


- (void)changevoice:(float)progress{
    [self initSlider];
    [self.slider setValue:progress animated:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)initSlider{
    if(!self.slider){
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        
        MPVolumeView *m_volumeView = [[MPVolumeView alloc]initWithFrame:CGRectMake(10, -40, 200, 30)];
        [[[UIApplication sharedApplication] keyWindow] addSubview:m_volumeView];
        m_volumeView.showsVolumeSlider = NO;
        UISlider* volumeViewSlider = nil;
        for (UIView *view in [m_volumeView subviews]){
            if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
                volumeViewSlider = (UISlider*)view;
                break;
            }
        }
        self.slider = volumeViewSlider;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBack:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationBecomActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
        self.currentVoiceValue = [[AVAudioSession sharedInstance] outputVolume];
    }
}

/**
 *  @author 智奎宇, 15-12-21 14:12:10
 *
 *  改变系统音量到最大
 */
- (void)changeVoiceToMax:(UIView *)view{
    [self initSlider];
    self.slider.value = 1;
}

/**
 *  @author 智奎宇, 15-12-21 14:12:45
 *
 *  重置到最开始系统音量
 */
- (void)resetToOldVoiceValue{
    NSLog(@"当前音量 = %f",self.currentVoiceValue);
    [self.slider setValue:self.currentVoiceValue animated:NO];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    
}
- (void)applicationEnterBack:(id)sender{
    
    [self.slider setValue:self.currentVoiceValue animated:NO];
    
}
- (void)applicationBecomActive:(id)sender{
    
    [self.slider setValue:1 animated:NO];
    
}
@end
