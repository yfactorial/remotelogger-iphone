//
//  RemoteLogger.h
//  iphone-harvest
//
//  Created by Josh Vickery on 4/2/09.
//  Copyright 2009 Josh Vickery. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RemoteLogger : NSObject {
	@private
		NSOperationQueue *loggerQueue;

}
+ (void) setupWithAppKey:(NSString *)appKey;
+ (void)log:(NSString *)message;

@end
