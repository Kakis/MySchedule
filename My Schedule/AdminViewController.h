//
//  AdminViewController.h
//  Mitt Schema
///
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditViewController;
@class MessageToAllServiceViewController;
@class MessageToOneServiceViewController;

@interface AdminViewController : UIViewController
{
    EditViewController *editController;
    MessageToOneServiceViewController *messageToOne;
    MessageToAllServiceViewController *messageToAll;
}


// Arrays with all studentNames and all studentCourses
@property (nonatomic, strong) NSMutableArray *allStudents;
@property (nonatomic, strong) NSMutableArray *allCourses;


- (IBAction)editButton:(id)sender;
- (IBAction)allStudentsButton:(id)sender;
- (IBAction)oneStudentButton:(id)sender;


@end
