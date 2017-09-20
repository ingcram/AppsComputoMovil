//
//  ViewController.m
//  SecondApp
//
//  Created by Roberto Alvarez on 13/09/17.
//  Copyright © 2017 Roberto Alvarez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *miLabel;
@property (weak, nonatomic) IBOutlet UIView *viewCircle;
@property (weak, nonatomic) IBOutlet UILabel *labelR;
@property (weak, nonatomic) IBOutlet UILabel *labelG;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;

@end

@implementation ViewController
    int cont = 1;
    CAShapeLayer *circle ;
    CGFloat red;
    CGFloat blue;
    CGFloat green;

- (void)viewDidLoad {
    [super viewDidLoad];
    int radius = 60;
    circle = [CAShapeLayer layer];
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius)cornerRadius:radius].CGPath;
    
    circle.position = CGPointMake(CGRectGetMidX(self.view.frame)-radius,
                                  CGRectGetMidY(self.view.frame)-radius);
    
    circle.fillColor = [UIColor greenColor].CGColor;
    circle.lineWidth = 0;
    
    [self.view.layer addSublayer:circle];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toogleSwitch:(id)sender {

    UISwitch *mySwitch = (UISwitch *)sender;
    
    if ([mySwitch isOn]) {
        circle.hidden = NO;
    } else {
        circle.hidden = YES;
    }
}

- (IBAction)PushButtonRobert:(id)sender {
    NSString *miArray[] = {@"Mensaje 1",@"Mensaje 2",@"Mensaje 3",@"Mensaje 4",@"Mensaje 5"};
    UIColor *colorArray[] = {UIColor.blueColor,UIColor.redColor,UIColor.greenColor,UIColor.blackColor,UIColor.yellowColor};
    
    self.miLabel.text = miArray[cont];
    self.miLabel.textColor = colorArray[cont];
    
    if(cont == 4){
        cont = 0;
    }else{
        cont++;
    }
}

- (IBAction)slider1Changed:(id)sender {

    [self drawCircle];
}
- (IBAction)slider2:(id)sender {
    
   
    [self drawCircle];

}
- (IBAction)slider3Changed:(id)sender {
  
    [self drawCircle];

}

- (void)drawCircle{
    
    self.labelR.text  = [@((int)self.slider1.value) stringValue];
    self.labelG.text  = [@((int)self.slider2.value) stringValue];
    self.labelB.text  = [@((int)self.slider3.value) stringValue];
    
    red = self.slider1.value/255;
    green = self.slider2.value/255;
    blue = self.slider3.value/255;

    circle.fillColor = [[UIColor colorWithRed: red green:green blue:blue alpha:1] CGColor];
    
    circle.lineWidth = 3;
    [self.view.layer addSublayer:circle];
}

- (IBAction)btnAlert:(id)sender {
    
    NSString *msj =  [self.nameTextField.text stringByAppendingString: @" "];
    msj = [msj stringByAppendingString:self.telTextField.text];
    msj = [msj stringByAppendingString: @" "];
    if(circle.isHidden){
        msj = [msj stringByAppendingString:@" No hay circulo"];
        
    }else{
        NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(red * 255), (int)(green * 255), (int)(blue * 255)];
         msj = [msj stringByAppendingString:hexString];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta Magica"
                                                    message:msj
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
- (IBAction)btnLucky:(id)sender {
    
    int randomRed = (int)1 + arc4random() % (255+1);
    int randomGreen = (int)1 + arc4random() % (255+1);
    int randomBlue = (int)1 + arc4random() % (255+1);
    
    self.slider1.value = 1 + arc4random() % (255+1);
    self.slider2.value = 1 + arc4random() % (255+1);
    self.slider3.value = 1 + arc4random() % (255+1);
     [self drawCircle];

}


@end
