//
//  EditViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EditCourseViewController;
@interface EditViewController : UITableViewController
{
    EditCourseViewController * editCourseController;
    UIView *editView;
}

@property (nonatomic, retain) UIView *editView;
@end