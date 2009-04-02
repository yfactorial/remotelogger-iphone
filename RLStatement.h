//
//  RLStatement.h
//  iphone-harvest
//
//  Created by Josh Vickery on 4/2/09.
//  Copyright 2009 Josh Vickery. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RLStatement : NSObject {

	NSString *message;
	NSDate *loggedAt;
	
}

@property(nonatomic, retain) NSString *message;
@property(nonatomic, retain) NSString *level;
@property(nonatomic, retain) NSDate *loggedAt;

+ (void) setAppKey:(NSString *)appKey;

@end
