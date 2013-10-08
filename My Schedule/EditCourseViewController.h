//
//  EditCourseViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@class WeekViewController;
@class EditViewController;
@class NewLessonServiceViewController;

typedef void (^GetLessonResponse)(NSArray* getLessonResponses);


@interface EditCourseViewController : UITableViewController
{
    NSOperationQueue *queue;
    NewLessonServiceViewController *newLessonController;
    UIView *editCourseView;
}

@property (nonatomic, retain) UIView *editCourseView;

// Chosen students name and course
@property (nonatomic, strong) NSString *chosenCourse;

// All lessons properties in arrays
@property (nonatomic, retain) NSMutableArray *assignments;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, retain) NSMutableArray *courses;
@property (nonatomic, retain) NSMutableArray *days;
@property (nonatomic, retain) NSMutableArray *lessonTimes;
@property (nonatomic, retain) NSMutableArray *lessonNames;
@property (nonatomic, retain) NSMutableArray *subjects;
@property (nonatomic, retain) NSMutableArray *teachers;
@property (nonatomic, retain) NSMutableArray *weeks;
@property (nonatomic, retain) NSMutableArray *courseTypes;
@property (nonatomic, retain) NSMutableArray *ids;
@property (nonatomic, retain) NSMutableArray *revs;

@property (nonatomic, retain) NSMutableArray *lessonSubjectTitles;
@property (nonatomic, retain) NSMutableArray *lessonTimeTitles;


-(void)getAllLessonsForCourse:(NSString*)courseString
                 OnCompletion:(GetLessonResponse)getLessonResponse;

@end