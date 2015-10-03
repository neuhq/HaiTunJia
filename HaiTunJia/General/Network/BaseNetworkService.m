
#import "BaseNetworkService.h"
#import <objc/runtime.h>
#import "Reachability.h"
#import "JSONKit.h"
#import <CommonCrypto/CommonDigest.h>
@implementation BaseNetworkService

-(id)initWithApiUrl:(NSString *)api_url
{
    self = [self init];
    if (self)
    {
        self.api_url = api_url;
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        self.timeout = DEFAULT_TIMEOUT;
      //  [self setUrlRequestParm];
        [self getClassProperty];
    }
    return self;
}

-(void)setUrlRequestParm
{
    _urlRequest = [[NSMutableURLRequest alloc] init];
    [_urlRequest setHTTPMethod:@"POST"];
    [_urlRequest setTimeoutInterval:_timeout];
}
-(void)getClassProperty
{
    // 3.初始化基本数据类型的值为：-100
    // 01 获取当前类
    Class myClass = [self class];
    // 02 获取当前类中属性名字的集合
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(myClass, &count);
    // 03 遍历所有的属性
    for (int i = 0; i < count; i++)
    {
        // 获取当前属性的名字
        objc_property_t property = properties[i];
        const char * char_property_name = property_getName(property);
        // 如果获取到这个属性的名字
        if (char_property_name)
        {
            // 转换成字符串对象
            NSString *property_name = [[NSString alloc] initWithCString:char_property_name encoding:NSUTF8StringEncoding];
            // 获取当前属性对应的内容
            id value = [self valueForKey:property_name];
            // 判断当前对象是数值对象
            if ([value isKindOfClass:[NSValue class]])
            {
                // 设置默认值：-100
                [self setValue:@(-100) forKey:property_name];
            }
        }
    }

}
- (void)requestDataWithParamsBlcok:(SetParamsBlock)paramsBlock
                              FinishBlock:(FinishBlock)finishBlock
                             failureBlock:(FailureBlock)failureBlock
{
    // 取消之前的网络请求
    [_requestOperation cancel];
    
    // 判断当前是否有网络
    if (![Reachability reachabilityWithHostname:kApi_Base].isReachable)
    {
        NSError *error= [NSError errorWithDomain:@"当前无网络" code:9999 userInfo:nil];  //直接返回网络错误
        failureBlock(error);
        return;
     }
    // 添加请求对象参数配置设置block
    if (paramsBlock != nil) {
        paramsBlock();
    }

    // 1.设置请求对象的请求地址
    _urlRequest.URL = [NSURL URLWithString:_api_url];
    // 获取当前对象的参数
    NSMutableDictionary *attributes = [self getMyClassAttributeNameAndValue];
    // 4.设置网络请求
    __weak BaseNetworkService *weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _requestOperation =   [manager POST:_api_url parameters:attributes success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSDictionary *result = [responseObject objectFromJSONData];
        NSLog(@"result:%@",result);
                finishBlock(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [operation cancel];
        weakSelf.requestOperation = nil;
    }];
    NSLog(@"%@",_requestOperation);
}
// 获取当前对象已经设置内容的数据名字和对应的内容
- (NSMutableDictionary *)getMyClassAttributeNameAndValue
{
    // 1.创建一个可变字典获取当前类的属性和内容
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    // 2.获取当前类中所有属性名字的集合
    // 01 获取当前类
    Class myClass = [self class];
    // 02 获取当前类中属性名字的集合
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(myClass, &count);
    // 03 遍历所有的属性
    for (int i = 0; i < count; i++) {
        // 获取当前属性的名字
        objc_property_t property = properties[i];
        const char * char_property_name = property_getName(property);
        // 如果获取到这个属性的名字
        if (char_property_name) {
            // 转换成字符串对象
            NSString *property_name = [[NSString alloc] initWithCString:char_property_name encoding:NSUTF8StringEncoding];
            // 获取当前属性对应的内容
            id value = [self valueForKey:property_name];
            if ([value isKindOfClass:[NSData class]] || (value != nil && [value intValue] != -100)) {
                [attributes setObject:value forKey:property_name];
            }
        }
    }
    
    return attributes;
}
/*
- (NSString *)URLWithParameters:(NSDictionary *)parameters{
    NSMutableString *urlString =[NSMutableString string];   //The URL starts with the base string[urlString appendString:baseString];
    NSString *escapedString;
    NSInteger keyIndex = 0;
    for (id key in parameters) {
        //First Parameter needs to be prefixed with a ? and any other parameter needs to be prefixed with an &
        if(keyIndex ==0) {
            escapedString = [NSString stringByAddingPercentEscapes:[parameters valueForKey:key] withEscapsePattern:URL_PERCENT_ESCAPES];
            [urlString appendFormat:@"?%@=%@",key,escapedString];
        }else{
            escapedString = [NSString stringByAddingPercentEscapes:[parameters valueForKey:key] withEscapsePattern:URL_PERCENT_ESCAPES];
            [urlString appendFormat:@"&%@=%@",key,escapedString];
        }
        keyIndex++;
    }
    return urlString;
}
 */
@end
