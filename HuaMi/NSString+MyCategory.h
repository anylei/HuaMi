//
//  NSString+MyCategory.h
//  HuaMi
//
//  Created by Fred Liang on 3/1/13.
//  Copyright (c) 2013 Fred Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MyCategory)
- (NSString *)hmac_md5:(NSString *) secret;
@end
