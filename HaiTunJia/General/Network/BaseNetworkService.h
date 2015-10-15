/*************************************
 功能：网络请求类
 说明：网络请求框架，网络请求封装
            此类
 ************************************/
#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"


// 超时时间
static const NSInteger DEFAULT_TIMEOUT = 30;

/**
 *  请求成功
 *
 *  @param result 接收数据
 */
typedef void(^FinishBlock)(id result);

/**
 *  请求失败
 *
 *  @param error 错误信息
 */
typedef void(^FailureBlock)(NSError *error);

/**
 *  设置请求参数
 */
typedef void(^SetParamsBlock)(void);          // 设置参数d的block

@interface BaseNetworkService : NSObject

/**超时时间*/
@property(nonatomic, assign) NSUInteger timeout;

/** 网络请求对象*/
@property (nonatomic ,strong) AFHTTPRequestOperation *requestOperation;

@property (nonatomic, strong) NSURLSessionDataTask *task;

@property (nonatomic ,strong) NSMutableURLRequest *urlRequest;

@property(nonatomic, strong) NSString *api_url;
/**
 *  api初始化方法
 *
 *  @param api_url api
 *
 *  @return return value description
 */
- (instancetype)initWithApiUrl:(NSString *)api_url;

/**
 *  开始网络请求
 *
 *  @param paramsBlock  参数
 *  @param finishBlock  收到数据
 *  @param failureBlock 错误信息
 */
- (void)requestDataWithParamsBlcok:(SetParamsBlock)paramsBlock
                       FinishBlock:(FinishBlock)finishBlock
                      failureBlock:(FailureBlock)failureBlock;

-(void)showResponsMessage:(NSString *) message;

- (void)upLoadImage:(UIImage *)image WithParamsBlcok:(SetParamsBlock)paramsBlock
        FinishBlock:(FinishBlock)finishBlock
       failureBlock:(FailureBlock)failureBlock;

@end
