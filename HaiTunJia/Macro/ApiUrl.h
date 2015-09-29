/**************************************
 功能：海豚家api
 说明：接口分类排列
 *************************************/

#ifndef HaiTunJia_ApiUrl_h
#define HaiTunJia_ApiUrl_h


#define kApi_Base              @"https://123.56.129.90/"

#pragma mark -- 用户相关

//1.获取验证码
#define kApi_ GetVerifyCode                     [kApi_Base stringByAppendingString:@"api/v1/code"]

//2.用户注册
#define kApi_UserRegist                           [kApi_Base stringByAppendingString:@"api/v1/regist"]

//3.用户登录
#define kApi_UserLogin                             [kApi_Base stringByAppendingString:@"api/login"]

//4.粉丝列表
#define kApi_GetFansList                          [kApi_Base stringByAppendingString:@"api/v1/followerList"]

//5.关注列表
#define kApi_GetFollowList                        [kApi_Base stringByAppendingString:@"api/v1/followList"]

//6.刷新个人信息
#define kApi_RefreshUserInfo                    [kApi_Base stringByAppendingString:@"api/v1/refreshUser"]

//7.通过商品查看用户信息
#define kApi_CheckUserInfo                       [kApi_Base stringByAppendingString:@"api/v1/selectedUser"]

//8.用户收到的评论列表
#define kApi_GetCommentList                     [kApi_Base stringByAppendingString:@"api/newComment"]

//9.用户收到的赞列表
#define kApi_GetLikeList                              [kApi_Base stringByAppendingString:@"api/v1/newPraise"]

//10.更改关注关系
#define kApi_ChangeFollow                         [kApi_Base stringByAppendingString:@"api/v1/follow"]

//11.取消粉丝
#define kApi_CancleFans                             [kApi_Base stringByAppendingString:@"api/v1/follower"]

//12.修改用户信息（包含头像）
#define kApi_ChangeUserInfo_ContainAvatar                        [kApi_Base stringByAppendingString:@"api/v1/editDetail"]

//13.修改用户信息(不包含头像)
#define kApi_ChangeUserInfo_NotContainAvatar                   [kApi_Base stringByAppendingString:@"api/v1/editDetailNoPic"]

//14.修改密码
#define kApi_ModifyPassword                                                 [kApi_Base stringByAppendingString:@"api/v1/editPassword"]



#pragma mark --商品相关

//1.商品列表
#define kApi_GetCommodityList                               [kApi_Base stringByAppendingString:@"api/v1/commodityList"]

//2.热门标签搜索列表
#define kApi_GetHotTagSeachList                            [kApi_Base stringByAppendingString:@"api/v1/hotSelected"]

//3.输入信息搜索列表
#define kApi_Search                                                  [kApi_Base stringByAppendingString:@"api/v1/selected"]

//4.商品详情
#define kApi_GetCommodityDetail                             [kApi_Base stringByAppendingString:@"api/commodityComment"]

//5.用户收藏列表
#define kApi_GetUserCollectList                                 [kApi_Base stringByAppendingString:@"api/v1/userCollectList"]

//6.用户发布列表
#define kApi_GetUserReleaseList                               [kApi_Base stringByAppendingString:@"api/v1/userCommodityList"]

//7.其他用户发布列表
#define kApi_GetOtherUserRlist                                  [kApi_Base stringByAppendingString:@"api/v1/selectedUserCommodityList"]

//8.获取当前商品评论列表
#define kApi_GetGoodsCommentList                          [kApi_Base stringByAppendingString:@"api/v1/commentsList"]

//9.获取当前商品赞列表
#define kApi_GetGoodsLikeList                                   [kApi_Base stringByAppendingString:@"api/praiseList"]

//10.发表评论
#define kApi_AddComment                                          [kApi_Base stringByAppendingString:@"api/v1/addComment"]

//11.收藏商品
#define kApi_CollectGoods                                          [kApi_Base stringByAppendingString:@"api/v1/collect"]

//12.删除商品
#define kApi_DeleteGoods                                           [kApi_Base stringByAppendingString:@"api/v1/deleteCommodity"]

//13.点赞
#define kApi_TapLike                                                   [kApi_Base stringByAppendingString:@"api/v1/praise"]

//发布商品
#define kApi_ReleaseGoods                                        [kApi_Base stringByAppendingString:@"api/v1/applyCommodity"]



#pragma mark -- 系统相关

#define kApi_FeedBack                                                 [kApi_Base stringByAppendingString:@"api/v1/applyCommodity"]






#endif
