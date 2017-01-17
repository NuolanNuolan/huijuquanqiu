//
//  HttpManager.h
//  PerfectProject
//
//  Created by Meng huan on 14/11/27.
//  Copyright (c) 2014年 M.H Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

// md5加密
#import <CommonCrypto/CommonDigest.h>

// AFNetworking
#import "AFNetworking.h"

// 网络状态处理
#import "Reachability.h"



#pragma mark - NSString扩展
/**
 *  NSString扩展
 */
@interface NSString (HttpManager)

// md5
- (NSString *)md5;

// 编码
- (NSString *)encode;

// 解码
- (NSString *)decode;

// 字符串转字典对象
- (id)object;

@end


#pragma mark - NSObject扩展
/**
 *  NSObject扩展
 */
@interface NSObject (HttpManager)

// json转字符串
- (NSString *)json;

@end


#pragma mark - Http网络管理器
/**
 *  Http网络管理器
 */
@interface HttpManager : NSObject
@property(copy, nonatomic) void (^lastCompleteBlock)(BOOL successed, NSDictionary *result);
+ (HttpManager *)defaultManager;

/**
 *  判断当前的网络类型
 *
 *  @return NotReachable     - 没有网络连接
 *  @return ReachableViaWWAN - 移动网络(2G、3G)
 *  @return ReachableViaWiFi - WIFI网络
 */
- (NetworkStatus)networkStatus;


// GET 请求
- (void)getRequestToUrl:(NSString *)url
                 params:(NSDictionary *)params
               complete:(void (^)(BOOL successed, NSDictionary *result))complete;

// 如果有本地缓存数据直接从缓存读取，没有则从服务器端获取
- (void)localCacheToUrl:(NSString *)url
                 params:(NSDictionary *)params
               complete:(void (^)(BOOL successed, NSDictionary *result))complete;

// 未联网时使用缓存数据
- (void)getCacheToUrl:(NSString *)url
               params:(NSDictionary *)params
             complete:(void (^)(BOOL successed, NSDictionary *result))complete;

// POST 请求
- (void)postRequestToUrl:(NSString *)url
                  params:(NSDictionary *)params
                complete:(void (^)(BOOL successed, NSDictionary *result))complete;


/**
 *  暂停，恢复，取消
 */
//- (void)pause;
//- (void)resume;
//- (void)cancel;


/**
 *  上传文件
 *
 *  可以暂停、重新开启、取消 [operation pause]、[operation resume];、[operation cancel];
 *
 *  @param url      请求URL
 *  @param params   请求参数
 *  @param files    上传的文件数组，数组里为多个字典字
 *                  典里的key:
 *                  1、name: 文件名称（如：demo.jpg）
 *                  2、file: 文件   （支持四种数据类型：NSData、UIImage、NSURL、NSString）NSURL、NSString为文件路径
 *                  3、key : 文件对应字段的key（默认：file）
 *                  4、type: 文件类型（默认：image/jpeg）
 *                  示例： @[@{@"file":_headImg.currentBackgroundImage,@"name":@"head.jpg"}];
 *
 *  @param complete 上传完成
 *
 *  @return
 */
- (AFHTTPRequestOperation *)uploadToUrl:(NSString *)url
                                 params:(NSDictionary *)params
                                  files:(NSArray *)files
                               complete:(void (^)(BOOL successed, NSDictionary *result))complete;

// 可以查看进度 process_block
- (AFHTTPRequestOperation *)uploadToUrl:(NSString *)url
                                 params:(NSDictionary *)params
                                  files:(NSArray *)files
                                process:(void (^)(NSInteger writedBytes, NSInteger totalBytes))process
                               complete:(void (^)(BOOL successed, NSDictionary *result))complete;


/*
 filePath : 下载文件的存储路径
 response : 接口返回的不是文件而是json数据
 process  : 进度
 */
/**
 *  下载文件
 *
 *  @param url      下载请求的URL
 *  @param filePath 下载文件的存储路径
 *  @param complete 下载完成
 *
 *  @return
 */
- (AFHTTPRequestOperation *)downloadFromUrl:(NSString *)url
                                   filePath:(NSString *)filePath
                                   complete:(void (^)(BOOL successed, NSDictionary *response))complete;

// 可以查看进度 process_block
- (AFHTTPRequestOperation *)downloadFromUrl:(NSString *)url
                                     params:(NSDictionary *)params
                                   filePath:(NSString *)filePath
                                    process:(void (^)(NSInteger readBytes, NSInteger totalBytes))process
                                   complete:(void (^)(BOOL successed, NSDictionary *response))complete;

@end
