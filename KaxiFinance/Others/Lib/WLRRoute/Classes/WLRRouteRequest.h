//
//  WLRRouteRequest.h
//  Pods
//
//  Created by Neo on 2016/12/15.
//
//

#import <Foundation/Foundation.h>

@interface WLRRouteRequest : NSObject<NSCopying>

@property (nonatomic, copy, readonly) NSURL *URL;

@property(nonatomic,copy) NSString * routeExpression;
//如果URL是AppScheme://user/login/138********?/callBack="",那么这个callBack就出现在这
@property (nonatomic, copy, readonly) NSDictionary *queryParameters;
//这里面会出现{@"phone":@"138********"}
@property (nonatomic, copy, readonly) NSDictionary *routeParameters;
// param参数
@property (nonatomic, copy, readonly) NSDictionary *primitiveParams;
//自动检测窃取回调的callBack 的Url
@property (nonatomic, strong) NSURL *callbackURL;

@property(nonatomic,copy)void(^targetCallBack)(NSError *error,id responseObject);

@property(nonatomic)BOOL isConsumed;

- (id)objectForKeyedSubscript:(NSString *)key;

-(instancetype)initWithURL:(NSURL *)URL routeExpression:(NSString *)routeExpression routeParameters:(NSDictionary *)routeParameters primitiveParameters:(NSDictionary *)primitiveParameters targetCallBack:(void(^)(NSError * error,id responseObject))targetCallBack;

-(instancetype)initWithURL:(NSURL *)URL;

-(void)defaultFinishTargetCallBack;

@end
