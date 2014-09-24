//
//  main.m
//  lockscreen
//
//  Created by m-nakada on 9/24/14.
//  Copyright (c) 2014 m-nakada All rights reserved.
//

//
// <Reference>
// http://apple.stackexchange.com/questions/80058/lock-screen-command-one-liner
//
// <Build>
// clang -framework Foundation main.m -o lockscreen
//
// <Run>
// ./lockscreen
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSBundle *bundle = [NSBundle bundleWithPath:@"/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu"];

    Class principalClass = [bundle principalClass];
    id instance = [[principalClass alloc] init];

    if ([instance respondsToSelector:@selector(_lockScreenMenuHit:)]) {
      [instance performSelector:@selector(_lockScreenMenuHit:) withObject:nil];
    }
    else {
      fprintf(stderr, "Could not execute to lock screen.\n");
    }
  }

  return 0;
}
