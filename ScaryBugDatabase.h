//
//  ScaryBugDatabase.h
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 2/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScaryBugDatabase : NSObject {

}


+ (NSMutableArray *)loadScaryBugDocs;
+ (NSString *)nextScaryBugDocPath;

@end
