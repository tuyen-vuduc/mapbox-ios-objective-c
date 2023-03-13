//
//  NSArray+HoF.h
//  mapboxqs
//
//  Created by Tuyen Vu on 13/03/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray(HoF)
- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
- (BOOL)contains:(BOOL (^)(id obj))block;
- (void)forEach:(void (^)(id obj))block;
@end

NS_ASSUME_NONNULL_END
