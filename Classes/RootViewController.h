//
//  RootViewController.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *_bugs;
}

@property (retain) NSMutableArray *bugs;

@end
