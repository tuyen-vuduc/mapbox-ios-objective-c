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

@property (readonly) NSString* title;
@property (readonly) NSString* subtitle;
@property double testTimeout;
@property (readonly) Class _Nonnull viewControllerClass;

- (instancetype) initWithTitle: (NSString*) title subtitle: (NSString*) subtitle type: (Class) type;

- (UIViewController*) makeViewController;

+ (NSString*) finishNotificationName;

@end


NS_ASSUME_NONNULL_END
