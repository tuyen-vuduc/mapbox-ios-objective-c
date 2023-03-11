//
//  SceneDelegate.m
//  mapboxqs
//
//  Created by Tuyen Vu on 5/6/22.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (id) init {
  self = [super init];
  
  self.windows = [[NSMutableArray alloc] init];

  return self;
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
  UIWindowScene* windowScene = (UIWindowScene*) scene;
  UIWindow* window = [[UIWindow alloc] initWithWindowScene:windowScene];
  
  ExampleTableViewController* examplesTableViewController = [[ExampleTableViewController alloc] init];
  UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController: examplesTableViewController];
  
  UINavigationBar *navigationBar = UINavigationBar.appearance;
  navigationBar.prefersLargeTitles = true;
  navigationBar.scrollEdgeAppearance = [[UINavigationBarAppearance alloc] init];
  
  window.rootViewController = navigationController;
  [window makeKeyAndVisible];
  
  [self.windows addObject:window];
}

@end
