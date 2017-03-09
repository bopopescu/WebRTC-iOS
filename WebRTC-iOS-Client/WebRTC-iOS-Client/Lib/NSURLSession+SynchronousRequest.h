//
//  NSURLSession+SynchronousRequest.h
//  WebRTC-iOS-Client
//
//  Created by Innovation on 3/8/17.
//  Copyright © 2017 Innovation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession_SynchronousRequest : NSURLSession

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request
                 returningResponse:(NSURLResponse **)response
                             error:(NSError **)error;
@end
