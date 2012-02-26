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
	NSString *_docPath;
}

@property (retain) ScaryBugData *data;
@property (retain) UIImage *thumbImage;
@property (retain) UIImage *fullImage;
@property (copy) NSString *docPath;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullimage;
- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (void)saveData;
- (void)deleteDoc;
- (void)saveImages;

@end
