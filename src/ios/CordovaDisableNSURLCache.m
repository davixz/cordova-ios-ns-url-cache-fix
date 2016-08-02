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
    Int nsUrlCacheMemoryCapacity = [self.commandDelegate.settings objectForKey:[@"nsUrlCacheMemoryCapacity" intValue]];
    nsUrlCacheMemoryCapacity = nsUrlCacheMemoryCapacity == nil ? 4 : nsUrlCacheMemoryCapacity;

    Int nsUrlCacheDiskCapacity = [self.commandDelegate.settings objectForKey:[@"nsUrlCacheDiskCapacity" intValue]];
    nsUrlCacheDiskCapacity = nsUrlCacheDiskCapacity == nil ? 32 : nsUrlCacheDiskCapacity;

    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:nsUrlCacheMemoryCapacity * 1024 * 1024 diskCapacity:nsUrlCacheDiskCapacity * 1024 * 1024 diskPath:nil]; 

    [NSURLCache setSharedURLCache:URLCache];    
}

- (CordovaIosNsUrlCacheFix*)initWithWebView:(UIWebView*)theWebView
{
    return self;
}

@end