//
//  NewLessonServiceViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Lesson;

@interface NewLessonServiceViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    // Lesson-type already set to "lesson"
    // Lesson-course already set to chosenCourse
    
    IBOutlet UILabel *newLessonTitleLabel;
    IBOutlet UITextField *setAssignmentTextfield;
    IBOutlet UITextField *setClassroomTextfield;
    IBOutlet UITextField *setSubjectTextfield;
    IBOutlet UITextField *setTeacherTextfield;
    
}

- (IBAction)saveLessonButton:(id)sender;


// The course we want to create (iOS or Objective C)
@property (nonatomic, strong) NSString *chosenLessonCourse;

// Properties for holding textfields text
@property (nonatomic, strong) IBOutlet UITextField *setSubjectTextfield;
@property (nonatomic, strong) IBOutlet UITextField *setAssignmentTextfield;
@property (nonatomic, strong) IBOutlet UITextField *setClassroomTextfield;
@property (nonatomic, strong) IBOutlet UITextField *setTeacherTextfield;
@property (weak, nonatomic) IBOutlet UIButton *saveLessonButton;


// Dissmissing keyboards for all textfields
- (IBAction)dissmissSubjectKeyboard:(id)sender;
- (IBAction)dissmissClassroomKeyboard:(id)sender;
- (IBAction)dissmissTeacherKeyboard:(id)sender;
- (IBAction)dissmissAssignmentKeyboard:(id)sender;


// Creating arrays for days, weeks and lessontimes
@property (nonatomic, strong) NSArray *allDays;
@property (nonatomic, strong) NSArray *allWeeks;
@property (nonatomic, strong) NSArray *allLessontimes;


// Properties for a lesson
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *lessonType;
@property (nonatomic, copy) NSString *course;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *lessontime;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *classroom;
@property (nonatomic, copy) NSString *assignment;


- (void)saveLesson:(Lesson*)lesson;


@end
