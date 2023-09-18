//
//  ViewController.m
//  DynamicUI
//
//  Created by Natasha Machado on 2023-09-14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  CGFloat screenWidth = CGRectGetWidth(self.view.bounds);
  CGFloat screenHeight = CGRectGetHeight(self.view.bounds);
  
  self.textField = [[UITextField alloc] initWithFrame:CGRectMake((screenWidth - 300) / 2, (screenHeight - 40) / 2, 300, 40)];
  self.textField.borderStyle = UITextBorderStyleRoundedRect;
  self.textField.delegate = self;
  [self.view addSubview:self.textField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSMutableAttributedString *updatedText = [[NSMutableAttributedString alloc] initWithString:textField.text];
  
  if ([textField.text rangeOfString:@"red" options:NSCaseInsensitiveSearch].location != NSNotFound) {
    [updatedText addAttribute:NSForegroundColorAttributeName
                        value:[UIColor redColor]
                        range:[textField.text rangeOfString:@"red" options:NSCaseInsensitiveSearch]];
    textField.attributedText = updatedText;
  }
  
  return YES;
}

@end
