//
//  WeekViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^GetCourseResponse)(NSArray* getLessonResponses);
typedef void (^GetMessageResponse)(NSArray* getMessageResponses);


@interface WeekViewController : UITableViewController
{
    NSOperationQueue *queue;
    NSMutableArray *section1LessonSubjectTitles;
    NSMutableArray *section2MessageSubjectTitiles;
    
    UIView *weekView;
}

@property (nonatomic, retain) UIView *weekView;

// UIPOpoverController for the DetailView
@property (nonatomic, retain) IBOutlet UIPopoverController *detailPop;

// Chosen students name and course
@property (nonatomic, strong) NSString *chosenStudent;
@property (nonatomic, strong) NSString *chosenStudentsCourse;

// All properties in arrays of Lessons
@property (nonatomic, retain) NSMutableArray *assignments;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, retain) NSMutableArray *courses;
@property (nonatomic, retain) NSMutableArray *days;
@property (nonatomic, retain) NSMutableArray *weeks;
@property (nonatomic, retain) NSMutableArray *lessonTimes;
@property (nonatomic, retain) NSMutableArray *lessonNames;
@property (nonatomic, retain) NSMutableArray *subjects;
@property (nonatomic, retain) NSMutableArray *teachers;

// All Titles for our TableView in section 1 - Schedule
@property (nonatomic, retain) NSMutableArray *section1LessonSubjectTitles;
@property (nonatomic, retain) NSMutableArray *section1LessonTimeTitles;

// All properties in arrays of Messages
@property (nonatomic, retain) NSMutableArray *messageSubjects;
@property (nonatomic, retain) NSMutableArray *messageSenders;
@property (nonatomic, retain) NSMutableArray *messageReceivers;
@property (nonatomic, retain) NSMutableArray *messages;

// All Titles for our TableView in section 2 - Messages
@property (nonatomic, retain) NSMutableArray *section2MessageSubjectTitles;
@property (nonatomic, retain) NSMutableArray *section2MessageSenderNames;

// Get-methods for Lessons, Private messages and Public messges
-(void)getAllLessonsForCourseOnCompletion:(GetCourseResponse)getLessonResponse;
-(void)getPrivateMessagesForStudentOnCompletion:(GetMessageResponse)getMessageResponse;
-(void)getMessagesForStudentsInCourseOnCompletion:(GetMessageResponse)getMessageResponse;


@end
