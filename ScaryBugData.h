//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScaryBugData : NSObject <NSCoding> {
	NSString *_title;
	float _rating;

}

@property (copy) NSString *title;
@property float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
