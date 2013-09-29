//
//  GCTurnBasedMatchHelper.h
//  spinningyarn
//
//  Created by Alexander Auritt on 9/29/13.
//
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface GCTurnBasedMatchHelper : NSObject
{
  BOOL gameCenterAvailable;
  BOOL userAuthenticated;
}

@property (assign, readonly) BOOL gameCenterAvailable;

+(GCTurnBasedMatchHelper *)sharedInstance;
-(void)authenticateLocalUser;

@end
