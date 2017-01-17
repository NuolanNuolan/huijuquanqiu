//
//  AppDelegate.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ScreenShotView.h"
#import "MainTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) MainTabBarController *tabBarViewController;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@property (strong, nonatomic) NSDictionary *userInfo;

@property (strong, nonatomic) ScreenShotView *screenshotView;

/// func
+ (AppDelegate* )shareAppDelegate;
@end

