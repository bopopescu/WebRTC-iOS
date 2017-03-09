//
//  NSURLSession+SynchronousRequest.m
//  WebRTC-iOS-Client
//
//  Created by Innovation on 3/8/17.
//  Copyright © 2017 Innovation. All rights reserved.
//

#import "NSURLSession+SynchronousRequest.h"

@implementation NSURLSession_SynchronousRequest


#pragma mark - Disi's implementation for NSURLSession synchronous request
+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request
                 returningResponse:(NSURLResponse **)response
                             error:(NSError **)error
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
    
    NSError __block *err = NULL;
    NSData __block *data;
    NSURLResponse __block *resp;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData* _data, NSURLResponse* _response, NSError* _error) {
                                         resp = _response;
                                         err = _error;
                                         data = _data;
                                         dispatch_group_leave(group);
                                         
                                     }] resume];
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    if (response)
    {
        *response = resp;
    }
    if (error)
    {
        *error = err;
    }
    
    return data;
}

@end
