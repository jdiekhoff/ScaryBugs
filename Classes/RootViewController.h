//
//  RootViewController.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditBugViewController;
@interface RootViewController : UITableViewController {
	NSMutableArray *_bugs;
	EditBugViewController *_editBugViewController;
}

@property (retain) NSMutableArray *bugs;
@property (retain) EditBugViewController *editBugViewController;

@end
