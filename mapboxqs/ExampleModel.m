//
//  ExampleModel.m
//  mapboxqs
//
//  Created by Tuyen Vu on 01/03/2023.
//

#import "ExampleModel.h"

@implementation ExampleModel

+ (NSString*) finishNotificationName {
    return @"com.mapbox.Examples.finish";
}

- (UIViewController *)makeViewController {
    if (!self.viewControllerClass) {
        [NSException raise:@"Missing ViewControllerClass" format:@"ViewControllerClass is required."];
    }

    UIViewController* exampleViewController;
    
    // Look for a storyboard
    NSString* storyboardName = [self.viewControllerClass description];
    if Bundle.main.path(forResource: storyboardName, ofType: "storyboardc") != nil {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        exampleViewController = storyboard.instantiateInitialViewController()!

        // Check controller is what we expect
        assert(Swift.type(of: exampleViewController) == exampleClass)
    } else {
        exampleViewController = exampleClass.init()
    }

    exampleViewController.title = title
    exampleViewController.navigationItem.largeTitleDisplayMode = .never

    return exampleViewController
}

@end
