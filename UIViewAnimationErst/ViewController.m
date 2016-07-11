//
//  ViewController.m
//  UIViewAnimationErst
//
//  Created by Cantoraz Chou on 7/11/16.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITextField* usernameField;
@property (nonatomic, weak) IBOutlet UITextField* passwordField;
@property (nonatomic, weak) IBOutlet UIButton*    loginButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Prepare position of usernameField
    CGPoint usernameFieldCenterPoint = CGPointMake(_usernameField.center.x - self.view.bounds.size.width, _usernameField.center.y);
    _usernameField.center = usernameFieldCenterPoint;
    
    // Prepare position of passwordField
    CGPoint passwrodFieldCenterPoint = CGPointMake(_passwordField.center.x - self.view.bounds.size.width, _passwordField.center.y);
    _passwordField.center = passwrodFieldCenterPoint;
    
    // Prepare position of loginButton
    CGPoint loginButtonCenterPoint = CGPointMake(_loginButton.center.x, _loginButton.center.y + 30.);
    _loginButton.center = loginButtonCenterPoint;
    _loginButton.alpha = 0.;
}

- (void)viewDidAppear:(BOOL)animated
{
    // Animate the usernameField
    [UIView animateWithDuration:.5f animations:^{
        CGPoint usernameCenterPoint = CGPointMake(_usernameField.center.x + self.view.bounds.size.width, _usernameField.center.y);
        _usernameField.center = usernameCenterPoint;

//        CGPoint passwrodCenterPoint = CGPointMake(_passwordField.center.x + self.view.bounds.size.width, _passwordField.center.y);
//        _passwordField.center = passwrodCenterPoint;
    }];
    
    // Animate the passwordField with delay
    [UIView animateWithDuration:.5f delay:.3f
                        options:UIViewAnimationOptionAllowUserInteraction
                               |UIViewAnimationCurveEaseOut
//                               |UIViewAnimationOptionRepeat
//                               |UIViewAnimationOptionAutoreverse
                     animations:^{
                         CGPoint passwrodCenterPoint = CGPointMake(_passwordField.center.x + self.view.bounds.size.width, _passwordField.center.y);
                         _passwordField.center = passwrodCenterPoint;
                     }
                     completion:NULL];
    
    CGAffineTransform rotation = CGAffineTransformMakeRotation((CGFloat)M_PI);
//    CGAffineTransform scale = CGAffineTransformMakeScale(2.f, 2.f);
//    CGAffineTransform rotationAndScale = CGAffineTransformConcat(rotation, scale);
    [UIView animateWithDuration:1.f animations:^{
        _loginButton.transform = rotation;
//        _loginButton.transform = rotationAndScale;
    }];
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
