//
//  EditBugViewController.m
//  ScaryBugs
//
//  Created by Joseph Diekhoff on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "EditBugViewController.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "UIImageExtras.h"
#import "DSActivityView.h"

@implementation EditBugViewController
@synthesize bugDoc = _bugDoc;
@synthesize titleField = _titleField;
@synthesize imageView = _imageView;
@synthesize rateView = _rateView;
@synthesize picker = _picker;
@synthesize activityView = _activityView;
@synthesize queue = _queue;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	_rateView.notSelectedImage = [UIImage imageNamed:@"shockedface2_empty.png"];
	_rateView.halfSelectedImage = [UIImage imageNamed:@"shockedface2_half.png"];
	_rateView.fullSelectedImage = [UIImage imageNamed:@"shockedface2_full.png"];
	_rateView.editable = YES;
	_rateView.maxRating = 5;
	_rateView.delegate = self;
	self.queue = [[[NSOperationQueue alloc] init] autorelease];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	self.picker = nil;
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	[super viewDidUnload];
	self.titleField = nil;
	self.imageView = nil;
	self.rateView = nil;
	
	self.queue = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[_bugDoc release];
	_bugDoc = nil;
	[_titleField release];
	_titleField = nil;
	[_imageView release];
	_imageView = nil;
	[_rateView release];
	_rateView = nil;
	[_picker release];
	_picker = nil;
	[_queue release];
	_queue = nil;
	
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
	_titleField.text = _bugDoc.data.title;
	_rateView.rating = _bugDoc.data.rating;
	_imageView.image = _bugDoc.fullImage;
	[super viewWillAppear:animated];
}

- (IBAction)titleFieldValueChanged:(id)sender {
	_bugDoc.data.title = _titleField.text;
	[_bugDoc saveData];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark RateViewDelegate

- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
	_bugDoc.data.rating = rating;
	[_bugDoc saveData];
}

- (IBAction)addPictureTapped:(id)sender {
	if(_picker == nil){
		[DSBezelActivityView newActivityViewForView:self.navigationController.navigationBar.superview withLabel:@"Loading Image Picker..." width:160];
		[_queue addOperationWithBlock: ^{
			self.picker = [[[UIImagePickerController alloc] init] autorelease];
			_picker.delegate = self;
			_picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			_picker.allowsEditing = NO;
			[[NSOperationQueue mainQueue] addOperationWithBlock:^{
				[DSBezelActivityView removeViewAnimated:YES];
				[self.navigationController presentModalViewController:_picker animated:YES];
			}];
		}];
	} else {
		[self.navigationController presentModalViewController:_picker animated:YES];
	}

}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediwWithInfo:(NSDictionary *)info {
	[self dismissModalViewControllerAnimated:YES];
	
	[DSBezelActivityView newActivityViewForView:self.navigationController.navigationBar.superview withLabel:@"Resizing Image..." width:160];
	[_queue addOperationWithBlock: ^{
		UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
		UIImage *thumbImage = [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44,44)];
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			_bugDoc.fullImage = fullImage;
			_bugDoc.thumbImage = thumbImage;
			_imageView.image = fullImage;
			[_bugDoc saveImages];
			[DSBezelActivityView removeViewAnimated:YES];
		}];
	}];
	
	 UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
	 UIImage *thumbImage = [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44, 44)];
	 _bugDoc.fullImage = fullImage;
	 _bugDoc.thumbImage = thumbImage;
	 _imageView.image = fullImage;
}

@end
