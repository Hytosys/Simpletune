//
//  STViewController.m
//  Simpletune
//
//  Created by Skyler on 2/7/13.
//  Copyright (c) 2013 Skyler. All rights reserved.
//

#import "STViewController.h"

@implementation STViewController

- (IBAction)noteButtonPressed:(id)sender {  
  NSString *filename = nil;
  STViewControllerNote newNote = [sender tag];
  
  if (currentNote_ == newNote) {
    currentNote_ = kNoteNone;
    [self destroyPlayTimer];
    [self destroyAudioPlayer];
    return;
  }
  
  switch (newNote) {
    case kNoteE3:
      filename = @"E3";
      break;
      
    case kNoteA3:
      filename = @"A3";
      break;
      
    case kNoteD4:
      filename = @"D4";
      break;
      
    case kNoteG4:
      filename = @"G4";
      break;
      
    case kNoteB4:
      filename = @"B4";
      break;
      
    case kNoteE5:
      filename = @"E5";
      break;
      
    case kNoteNone:
      break;
  }
  
  if (filename == nil) {
    return;
  }
  
  NSURL *fileURL = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:filename ofType:@"mp3"]];
  
  if (fileURL == nil) {
    return;
  }
  
  [self destroyAudioPlayer];
  [self destroyPlayTimer];
  
  currentNote_ = newNote;
  playCount_ = 1;
  audioPlayer_ = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
  audioPlayer_.delegate = self;
  [audioPlayer_ play];
  playTimer_ = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(playNote) userInfo:nil
                                               repeats:YES];
  [playTimer_ retain];
}

- (void)playNote {
  if (audioPlayer_.playing) {
    [audioPlayer_ setCurrentTime:0];
  }
  
  ++playCount_;
  
  if (playCount_ >= 5) {
    [self destroyPlayTimer];
  }
}

- (void)destroyAudioPlayer {
  if (audioPlayer_.playing) {
    [audioPlayer_ stop];
  }
  
  [audioPlayer_ release];
  audioPlayer_ = nil;
}

- (void)destroyPlayTimer {
  [playTimer_ invalidate];
  [playTimer_ release];
  playTimer_ = nil;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
  if (player != audioPlayer_) {
    return;
  }
  
  [self destroyAudioPlayer];
  [self destroyPlayTimer];
}

- (void)didReceiveMemoryWarning {
  [self destroyAudioPlayer];
  [self destroyPlayTimer];
  
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
  [self destroyAudioPlayer];
  [self destroyPlayTimer];
  
  [super dealloc];
}

@end
