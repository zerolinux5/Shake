//
//  CMPViewController.m
//  Shake
//
//  Created by jmagana7 on 2/1/13.
//  Copyright (c) 2013 jmagana7. All rights reserved.
//

#import "CMPViewController.h"

@interface CMPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playLabel;
- (IBAction)playButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *isPlaying;
@property(nonatomic) float rate;

@property (nonatomic) NSInteger play;

@end

@implementation CMPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.play = 0;
    self.rate = 1;
    [self initAudio];
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"clouds.jpg"]];
    [self.view setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initAudio
{
    NSURL *myUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"574928main_houston_problem"ofType:@"mp3"]];

    self->audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: myUrl error:nil];
}        

- (IBAction)playButton:(id)sender {
    self.play = 1;
    self.rate = 5;
    self->audioPlayer.numberOfLoops = -1;
    _playLabel.text =@"Music is Playing";
    [audioPlayer rate];
    [audioPlayer play];
}

- (BOOL) canBecomeFirstResponder{
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

-(void) normalShake{
    if (shakeCount % 2 == 0) {
        [audioPlayer stop];
        [audioPlayer play];
        shakeCount = 0;
        _playLabel.text =@"Music has restarted";        
    } else {
        if(self.play == 0){
            self.play = 1;
            [audioPlayer play];
            _playLabel.text =@"Music is Playing";
        } else {
            self.play = 0;
            [audioPlayer pause];
            _playLabel.text =@"Music is Paused";
        }
        shakeCount = 0;
    }
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.type == UIEventSubtypeMotionShake) {
        shakeCount++;
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector: @selector(normalShake) userInfo:nil repeats:NO];
    }
}

@end
