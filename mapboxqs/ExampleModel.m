//
//  ExampleModel.m
//  mapboxqs
//
//  Created by Tuyen Vu on 01/03/2023.
//

#import "ExampleModel.h"

@implementation ExampleModel

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle type:(Class)type {
    self = [self init];
    
    _title = title;
    _subtitle = subtitle;
    _viewControllerClass = type;
    
    return self;
}

+ (NSString*) finishNotificationName {
    return @"com.mapbox.Examples.finish";
}

- (UIViewController *)makeViewController {
    if (!self.viewControllerClass) {
        [NSException raise:@"Missing ViewControllerClass" format:@"ViewControllerClass is required."];
    }

    UIViewController* exampleViewController;
    
    // Look for a storyboard
    NSString* storyboardName = NSStringFromClass(self.viewControllerClass);
    
    if ([NSBundle.mainBundle pathForResource:storyboardName ofType:@"storyboardc"]) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
        
        exampleViewController = [storyboard instantiateInitialViewController];
    } else {
        exampleViewController = [[self.viewControllerClass alloc] init];
    }

    exampleViewController.title = self.title;
    exampleViewController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;

    return exampleViewController;
}

@end
