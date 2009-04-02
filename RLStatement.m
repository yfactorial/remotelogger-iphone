//
//  RLStatement.m
//  iphone-harvest
//
//  Created by Josh Vickery on 4/2/09.
//  Copyright 2009 Josh Vickery. All rights reserved.
//

#import "RLStatement.h"

static NSString *_remotePassword;

@implementation RLStatement

@synthesize message, loggedAt;

+ (void) setAppKey:(NSString *)appKey {
	_remotePassword = appKey;
	[_remotePassword retain];
}

+ (NSString *)getRemoteSite {
	return @"http://remoteloggerapp.com/api/v1/";
}

+ (NSString *)getRemoteUser {
	return [[UIDevice currentDevice] uniqueIdentifier];
}

+ (NSString *)getRemotePassword {
	return _remotePassword;
}

+ (NSString *)getRemoteElementName {
	return @"statement";
}

- (NSString *)jsonClassName {
	return [self.class getRemoteElementName];
}

+ (NSString *)xmlElementName {
	return [self getRemoteElementName];
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.loggedAt = [NSDate date];
	}
	return self;
}

- (NSString *) level {
	return @"INFO";
}

- (void) setLevel:(NSString *)level {
}

#pragma mark cleanup
- (void) dealloc
{
	[message release];
	[loggedAt release];
	[super dealloc];
}


@end
