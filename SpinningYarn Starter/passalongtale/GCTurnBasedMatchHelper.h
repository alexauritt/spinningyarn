//
//  GCTurnBasedMatchHelper.h
//  spinningyarn
//
//  Created by Alexander Auritt on 9/29/13.
//
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface GCTurnBasedMatchHelper : NSObject<GKTurnBasedMatchmakerViewControllerDelegate>
{
  BOOL gameCenterAvailable;
  BOOL userAuthenticated;
  
  UIViewController *presentingViewController;
}

@property (assign, readonly) BOOL gameCenterAvailable;
@property (retain) GKTurnBasedMatch * currentMatch;

+(GCTurnBasedMatchHelper *)sharedInstance;
-(void)authenticateLocalUser;
-(void)findMatchWithMinPlayers:(int)minPlayers maxPlayers:(int)maxPlayers viewController:(UIViewController *)viewController;

@end
