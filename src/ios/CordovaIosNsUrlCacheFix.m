//
//  CordovaIosNsUrlCacheFix.m
//  cordova-ios-ns-url-cache-fix
//
//  Created by David Azevedo  on 02/08/2016.
//
//

#import "CordovaIosNsUrlCacheFix.h"

@implementation CordovaIosNsUrlCacheFix

- (void)pluginInitialize
{

    id nsUrlCacheMemoryCapacityString = [self.commandDelegate.settings objectForKey: [@"nsUrlCacheMemoryCapacity" lowercaseString]];
    int nsUrlCacheMemoryCapacity = nsUrlCacheMemoryCapacityString == nil ? 4 : [nsUrlCacheMemoryCapacityString intValue];

    id nsUrlCacheDiskCapacityString = [self.commandDelegate.settings objectForKey: [@"nsUrlCacheDiskCapacity" lowercaseString]];
    int nsUrlCacheDiskCapacity = nsUrlCacheDiskCapacityString == nil ? 32 : [nsUrlCacheDiskCapacityString intValue];

    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:nsUrlCacheMemoryCapacity * 1024 * 1024 diskCapacity:nsUrlCacheDiskCapacity * 1024 * 1024 diskPath:nil]; 

    [NSURLCache setSharedURLCache:URLCache];    
}

- (CordovaIosNsUrlCacheFix*)initWithWebView:(UIWebView*)theWebView
{
    return self;
}

@end