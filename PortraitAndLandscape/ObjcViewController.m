//
//  ObjcViewController.m
//  PortraitAndLandscape
//
//  Created by 김호세 on 10/13/23.
//

#import "ObjcViewController.h"
#import "PortraitAndLandscape-Swift.h" // You have to replace with your swift module name

@interface ObjcViewController ()

@end

@implementation ObjcViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title =@"Screen 1";
  UIColor *colour = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
  self.view.backgroundColor = colour;

  NSString * someString = @"Something To Print";
  NSLog(@"%@", someString);

  UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
  [button setTitle:@"Press Me" forState:UIControlStateNormal];
  button.translatesAutoresizingMaskIntoConstraints = false;
  [self.view addSubview:button];

  [button.widthAnchor constraintEqualToConstant:80].active = YES;
  [button.heightAnchor constraintEqualToConstant:80].active = YES;
  [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
  [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;

  [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressed:(UIButton *)button {
  NSLog(@"Button Pressed");

  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

  UIInterfaceOrientationMask e = UIInterfaceOrientationMaskLandscapeRight;
  appDelegate.allList = e;

  NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
  [[UIDevice currentDevice] setValue:value forKey:@"orientation"];


}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
