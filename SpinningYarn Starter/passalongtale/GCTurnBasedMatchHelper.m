//
//  GCTurnBasedMatchHelper.m
//  spinningyarn
//
//  Created by Alexander Auritt on 9/29/13.
//
//

#import "GCTurnBasedMatchHelper.h"

@implementation GCTurnBasedMatchHelper

@synthesize gameCenterAvailable;

static GCTurnBasedMatchHelper *sharedHelper = nil;

+(GCTurnBasedMatchHelper *)sharedInstance
{
  if (!sharedHelper) {
    sharedHelper = [[GCTurnBasedMatchHelper alloc] init];
  }
  return sharedHelper;
}

@end
