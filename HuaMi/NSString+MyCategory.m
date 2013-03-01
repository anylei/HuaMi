//
//  NSString+MyCategory.m
//  HuaMi
//
//  Created by Fred Liang on 3/1/13.
//  Copyright (c) 2013 Fred Liang. All rights reserved.
//

#import "NSString+MyCategory.h"
#include <CommonCrypto/CommonHMAC.h>

@implementation NSString (MyCategory)

- (NSString*) hmac_md5:(NSString*) secret
{
    CCHmacContext    ctx;
    const char       *key = [secret UTF8String];
    const char       *str = [self UTF8String];
    unsigned char    mac[CC_MD5_DIGEST_LENGTH];
    char             hexmac[2 * CC_MD5_DIGEST_LENGTH + 1];
    char             *p;

    CCHmacInit( &ctx, kCCHmacAlgMD5, key, strlen( key ));
    CCHmacUpdate( &ctx, str, strlen(str) );
    CCHmacFinal( &ctx, mac );

    p = hexmac;
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) {
        snprintf( p, 3, "%02x", mac[ i ] );
        p += 2;
    }

    return [NSString stringWithUTF8String:hexmac];
}
@end
