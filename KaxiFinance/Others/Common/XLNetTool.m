//
//  XLNetTool.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/20.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "XLNetTool.h"
#import <AFNetworking/AFNetworking.h>
#import "KaxiHeader.h"

@implementation XLNetTool

+ (void)sendRequest:(NSString *)url {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    RACSignal *fetchData = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }] replayLazily];
    
    RACSignal *title = [fetchData flattenMap:^RACSignal *(id value) {
        
        return [RACSignal error:[NSError errorWithDomain:@"some error" code:400 userInfo:@{@"originData": value}]];
    }];
}

@end
