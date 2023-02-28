//
//  ExampleModel.h
//  mapboxqs
//
//  Created by Tuyen Vu on 01/03/2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleModel : NSObject

@property NSString* title;
@property double testTimeout;
@property Class* _Nonnull viewControllerClass;

- (UIViewController*) makeViewController;

+ (NSString*) finishNotificationName;

@end


NS_ASSUME_NONNULL_END
