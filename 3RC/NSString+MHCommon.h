//
//  NSString+MHCommon.h
//  PerfectProject
//
//  Created by Meng huan on 14/11/19.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSString 通用Category
 */
@interface NSString (MHCommon)


#pragma mark - 过滤html特殊字符
/**
 *  过滤html特殊字符
 *
 *  @return 过滤后的string
 */
- (NSString *)ignoreHTMLSpecialString;


#pragma mark - MD5加密
/**
 *  MD5加密
 *
 *  @return MD5加密后的新字段
 */
- (NSString *)md5;


#pragma mark - URL编码
/**
 *  URL编码，http请求遇到汉字的时候，需要转化成UTF-8
 *
 *  @return 编码的字符串
 */
- (NSString *)urlCodingToUTF8;


#pragma mark - URL解码
/**
 *  URL解码，URL格式是 %3A%2F%2F 这样的，则需要进行UTF-8解码
 *
 *  @return 解码的字符串
 */
- (NSString *)urlDecodingToUrlString;

/// 判断字符串包含另一个字符串

- (BOOL)containOfString:(NSString *)string;

/**
 *  字符串是否为空
 */
+ (BOOL)stringIsNull:(NSString*)string;
@end
