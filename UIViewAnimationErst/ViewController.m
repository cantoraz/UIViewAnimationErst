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
    
    // Animate the loginButton
    /*
    CGAffineTransform rotation = CGAffineTransformMakeRotation((CGFloat)M_PI);
//    CGAffineTransform scale = CGAffineTransformMakeScale(2., 2.);
//    CGAffineTransform rotationAndScale = CGAffineTransformConcat(rotation, scale);
    [UIView animateWithDuration:1. animations:^{
        _loginButton.transform = rotation;
//        _loginButton.transform = rotationAndScale;
        
    }];
     */

    [UIView animateWithDuration:3. delay:.5 usingSpringWithDamping:0.5 initialSpringVelocity:0. options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint loginButtonCenterPoint = CGPointMake(_loginButton.center.x, _loginButton.center.y - 30.);
        _loginButton.center = loginButtonCenterPoint;
        _loginButton.alpha = 1.;
    } completion:NULL];
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Recieved Actions

// Touch up inside loginButton
- (IBAction)login:(id)sender {
    [UIView animateWithDuration:.5 delay:0. usingSpringWithDamping:.2 initialSpringVelocity:0. options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGRect bounds = CGRectMake(_loginButton.bounds.origin.x, _loginButton.bounds.origin.y,
                                   _loginButton.bounds.size.width + 25, _loginButton.bounds.size.height);
        _loginButton.bounds = bounds;
    } completion:NULL];
    
    [UIView animateWithDuration:.6 delay:0. usingSpringWithDamping:.6 initialSpringVelocity:0. options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint center = CGPointMake(_loginButton.center.x, _loginButton.center.y + 10);
        _loginButton.center = center;
    } completion:NULL];
}

@end
