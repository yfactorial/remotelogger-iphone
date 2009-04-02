//
//  RemoteLogger.m
//  iphone-harvest
//
//  Created by Josh Vickery on 4/2/09.
//  Copyright 2009 Josh Vickery. All rights reserved.
//

#import "RemoteLogger.h"
#import "RLStatement.h"

@interface RemoteLogger ()

- (void) sendStatement:(RLStatement *)statement;

@end

static RemoteLogger *_instance;

@implementation RemoteLogger

- (id) init
{
	self = [super init];
	if (self != nil) {
		loggerQueue = [[NSOperationQueue alloc] init];
		[loggerQueue setMaxConcurrentOperationCount:1];
	}
	return self;
}


+ (void) setupWithAppKey:(NSString *)appKey {
	_instance = [[RemoteLogger alloc] init];
	[RLStatement setAppKey:appKey];
}

+ (void)log:(NSString *)message {
	RLStatement *statement = [[[RLStatement alloc] init] autorelease];
	statement.message = message;
	[_instance sendStatement:statement];
}

- (void) sendStatement:(RLStatement *)statement {
	NSInvocationOperation *operation = [[[NSInvocationOperation alloc] initWithTarget:statement selector:@selector(saveRemote) object:nil] autorelease];
	[operation setQueuePriority:NSOperationQueuePriorityLow];
	[loggerQueue addOperation:operation];
}

#pragma mark cleanup
- (void) dealloc
{
	[loggerQueue release];
	[super dealloc];
}


@end
