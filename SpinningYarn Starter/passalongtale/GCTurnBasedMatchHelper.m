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

#pragma mark Initialization

static GCTurnBasedMatchHelper *sharedHelper = nil;
+(GCTurnBasedMatchHelper *)sharedInstance
{
  if (!sharedHelper) {
    sharedHelper = [[GCTurnBasedMatchHelper alloc] init];
  }
  return sharedHelper;
}

-(BOOL)isGameCenterAvailable
{
  Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
  
  NSString *reqSysVer = @"4.1";
  NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
  BOOL osVersionSupported = ([currSysVer compare:reqSysVer
                                         options: NSNumericSearch] != NSOrderedAscending);
  
  return (gcClass && osVersionSupported);
}

-(id)init
{
  if ((self = [super init])) {
    gameCenterAvailable = [self isGameCenterAvailable];
    if (gameCenterAvailable) {
      NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
      [nc addObserver:self
             selector:@selector(authenticationChanged)
                 name:GKPlayerAuthenticationDidChangeNotificationName
               object:nil];
    }
  }
  return self;
}

-(void)authenticationChanged
{
  if ([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated) {
    NSLog(@"Authentication changed: player authenticated.");
    userAuthenticated = TRUE;
  } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
    NSLog(@"Authentication changed: player not authenticated");
    userAuthenticated = FALSE;
  }
}

#pragma mark User functions
-(void)authenticateLocalUser
{
  if (!gameCenterAvailable) return;
  NSLog(@"Authenticating local user...");
  if ([GKLocalPlayer localPlayer].authenticated == NO) {
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:nil];
  } else {
    NSLog(@"Already authenticated!");
  }
}
@end
