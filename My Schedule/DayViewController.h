//
//  DayViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayViewController : UIViewController
{
    __weak IBOutlet UILabel *subjectLabel;
    __weak IBOutlet UILabel *timeLabel;
    __weak IBOutlet UILabel *classroomLabel;
    __weak IBOutlet UILabel *teacherLabel;
    __weak IBOutlet UILabel *assignmentLabel;

}


// Chosen week
@property (nonatomic, strong) NSString *chosenWeek;
@property (weak, nonatomic) UILabel *weekLabel;

@property (nonatomic, strong) NSString *assignment;
@property (nonatomic, strong) NSString *classroom;
@property (nonatomic, strong) NSString *course;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *week;
@property (nonatomic, strong) NSString *lessonTime;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *teacher;


@end
