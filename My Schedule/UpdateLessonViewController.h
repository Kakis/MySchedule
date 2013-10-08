//
//  UpdateLessonViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lesson;

@interface UpdateLessonViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    // Lesson-type already set to "lesson"
    // Lesson-course already set to chosenCourse
    
    IBOutlet UILabel *updateLessonLabel;
    __weak IBOutlet UITextField *classroomTextfield;
    __weak IBOutlet UITextField *subjectTextfield;
    __weak IBOutlet UITextField *teacherTextfield;
    __weak IBOutlet UITextField *assignmentTextfield;
    UIPickerView *pickerView;
}

// Properties for holding textfields text
@property (nonatomic, strong) IBOutlet UITextField *updateSubjectTextfield;
@property (nonatomic, strong) IBOutlet UITextField *updateClassroomTextfield;
@property (nonatomic, strong) IBOutlet UITextField *updateTeacherTextfield;
@property (nonatomic, strong) IBOutlet UITextField *updateAssignmentTextfield;


// Property for holding our UIPickerView
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;


// Creating arrays for choosing day, week and lessontime
@property (nonatomic, strong) NSArray *allDays;
@property (nonatomic, strong) NSArray *allWeeks;
@property (nonatomic, strong) NSArray *allLessontimes;


// Properties for a lesson
@property (nonatomic, strong) NSString *assignment;
@property (nonatomic, strong) NSString *classroom;
@property (nonatomic, strong) NSString *course;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *week;
@property (nonatomic, strong) NSString *lessontime;
@property (nonatomic, strong) NSString *lessonName;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *teacher;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *idet;
@property (nonatomic, strong) NSString *rev;


- (IBAction)updateButton:(id)sender;

-(void)updateLesson:(Lesson*) aLesson : (NSString*)courseId : (NSString*)revNumber;


@end
