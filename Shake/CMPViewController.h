//
//  CMPViewController.h
//  Shake
//
//  Created by jmagana7 on 2/1/13.
//  Copyright (c) 2013 jmagana7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CMPViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    int shakeCount;
}
@end
