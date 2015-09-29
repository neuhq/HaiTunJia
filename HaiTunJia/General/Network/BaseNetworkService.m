
#import "BaseNetworkService.h"
#import <objc/runtime.h>
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
        [self setUrlRequestParm];
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

@end
