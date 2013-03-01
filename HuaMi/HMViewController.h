//
//  HMViewController.h
//  HuaMi
//
//  Created by Fred Liang on 2/28/13.
//  Copyright (c) 2013 Fred Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *keyTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (NSString *)calPassword:(NSString *)password key:(NSString *)key;
-(IBAction)copyButtonTapped:(id)sender;
@end
