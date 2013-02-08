//
//  STViewController.h
//  Simpletune
//
//  Created by Skyler on 2/7/13.
//  Copyright (c) 2013 Skyler. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

typedef enum {
  kNoteNone = 0,
  kNoteE3,
  kNoteA3,
  kNoteD4,
  kNoteG4,
  kNoteB4,
  kNoteE5
} STViewControllerNote;

@interface STViewController : UIViewController <AVAudioPlayerDelegate> {
 @private
  AVAudioPlayer *audioPlayer_;
  NSUInteger playCount_;
  NSTimer *playTimer_;
  STViewControllerNote currentNote_;
}

- (IBAction)noteButtonPressed:(id)sender;

@end
