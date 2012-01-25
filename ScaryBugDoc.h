//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScaryBugData;

@interface ScaryBugDoc : NSObject {
	ScaryBugData *_data;
	UIImage *_thumbImage;
	UIImage	*_fullImage;
}

@property (retain) ScaryBugData *data;
@property (retain) UIImage *thumbImage;
@property (retain) UIImage *fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullimage;

@end
