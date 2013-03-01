//
//  HMViewController.m
//  HuaMi
//
//  Created by Fred Liang on 2/28/13.
//  Copyright (c) 2013 Fred Liang. All rights reserved.
//

#import "HMViewController.h"
#import "NSString+MyCategory.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)copyButtonTapped:(id)sender {
    NSString *result = [self calPassword:self.pwdTextField.text key:self.keyTextField.text];
    self.resultLabel.text = result;

    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = result;
}

- (NSString *) calPassword:(NSString *)password key:(NSString *)key {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];

    NSString *md5one = [password hmac_md5:key];
    NSString *md5two = [md5one hmac_md5:@"snow"];
    NSString *md5three = [md5one hmac_md5:@"kise"];

    NSString *str = @"sunlovesnow1990090127xykab";

    for (int i = 0; i < 32; i++) {
        NSString *c2 = [md5two substringWithRange:NSMakeRange(i, 1)];

        if (![f numberFromString:c2]) {
            NSString *c3 = [md5three substringWithRange:NSMakeRange(i, 1)];

            if ([str rangeOfString:c3].location != NSNotFound) {
                md5two = [md5two stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[c2 uppercaseString]];
            }
        }
    }


    NSString *code1 = [md5two substringWithRange:NSMakeRange(0, 1)];
    NSString *code16;
    if (![f numberFromString:code1]) {
        code16 = [md5two substringWithRange:NSMakeRange(0, 16)];
    } else {
        code16 = [@"K" stringByAppendingString:[md5two substringWithRange:NSMakeRange(1, 15)]];
    }
    
    return code16;
}

@end
