//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ScaryBugData.h"


@implementation ScaryBugData
@synthesize title = _title;
@synthesize rating = _rating;

- (id) initWithTitle:(NSString*)title rating:(float)rating{
	if((self = [super init])) {
		_title = [title copy];
		_rating = rating;
	}
	return self;
}

- (void) dealloc {
	[_title release];
	_title = nil;
	[super dealloc];
}

@end
