//
//  MyView.h
//  Music147_2012
//
//  Created by Kojiro Umezaki on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView <UIAccelerometerDelegate> {

    UITouch* touch;
    
    IBOutlet UIButton* button1;
    IBOutlet UIButton* button2;
    IBOutlet UIButton* button3;
    IBOutlet UIButton* button4;
    
    IBOutlet UISlider* slider;
}

-(IBAction)toggleVoice0:(id)sender;
-(IBAction)toggleVoice1:(id)sender;
-(IBAction)toggleVoice2:(id)sender;
-(IBAction)toggleVoice3:(id)sender;

-(IBAction)doSlider:(id)sender;

-(IBAction)startPlay:(id)sender;
-(IBAction)stopPlay:(id)sender;
-(IBAction)startRec:(id)sender;
-(IBAction)stopRec:(id)sender;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)drawRect:(CGRect)draw_rect;

@end
