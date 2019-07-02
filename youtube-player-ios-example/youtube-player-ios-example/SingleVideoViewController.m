// Copyright 2014 Google Inc. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "SingleVideoViewController.h"

@implementation SingleVideoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *videoId = @"M7lc1UVf-VE";

  // For a full list of player parameters, see the documentation for the HTML5 player
  // at: https://developers.google.com/youtube/player_parameters?playerVersion=HTML5
  NSDictionary *playerVars = @{
      @"controls" : @0,
      @"playsinline" : @1,
      @"autohide" : @1,
      @"showinfo" : @0,
      @"modestbranding" : @1,
      @"origin": @"https://www.youtube.com"
  };
  self.playerView.delegate = self;
  [self.playerView loadWithVideoId:videoId playerVars:playerVars];
}

- (void)playerView:(WKYTPlayerView *)ytPlayerView didChangeToState:(WKYTPlayerState)state {
    NSString *message = [NSString stringWithFormat:@"Player state changed: %ld\n", (long)state];
    NSLog(@"%@", message);
}

- (void)playerView:(WKYTPlayerView *)playerView didPlayTime:(float)playTime {
    NSLog(@"Progress: %f", playTime);
}

- (void)playerViewDidBecomeReady:(WKYTPlayerView *)playerView {
    [playerView playVideo:nil];
}

@end
