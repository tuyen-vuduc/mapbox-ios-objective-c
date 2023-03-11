//
//  AppDelegate.m
//  mapboxqs
//
//  Created by Tuyen Vu on 5/6/22.
//

#import "AppDelegate.h"
#import "ExampleTableViewController.h"
#import "SceneDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    UINavigationBar *navigationBar = UINavigationBar.appearance;
    navigationBar.prefersLargeTitles = true;
    
    if (@available(iOS 13.0, *)) {
        navigationBar.scrollEdgeAppearance = [[UINavigationBarAppearance alloc] init];
    } else {
        ExampleTableViewController* examplesTableViewController = [[ExampleTableViewController alloc] init];
        UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController: examplesTableViewController];
        window.rootViewController = navigationController;
        [window makeKeyAndVisible];
    }
    
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - UISceneSession lifecycle


//@available(iOS 13.0, *)
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    UISceneConfiguration* config = [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
    config.delegateClass = SceneDelegate.class;
    config.sceneClass = UIWindowScene.class;
 
    return config;
}


//@available(iOS 13.0, *)
- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

