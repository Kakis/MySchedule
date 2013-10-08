//
//  DayViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "DayViewController.h"
#import "WeekViewController.h"

@interface DayViewController ()

@end


@implementation DayViewController

@synthesize assignment, classroom, course, day, week, lessonTime, subject, teacher;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    NSMutableString *dayTitle = [[NSMutableString alloc] init];
    [dayTitle appendString:day];
    [dayTitle appendString:@" "];
    [dayTitle appendString:@"week"];
    [dayTitle appendString:@" "];
    [dayTitle appendString:week];
    
    self.title = [NSString stringWithFormat:@"%@", dayTitle];
    
    NSMutableString *subjectString = [[NSMutableString alloc] init];
    [subjectString appendString:subject];
    
    subjectLabel.text = subjectString;
    
    
    NSMutableString *timeString = [[NSMutableString alloc] init];
    [timeString appendString:@"Time:"];
    [timeString appendString:@" "];
    [timeString appendString:lessonTime];
    
    timeLabel.text = timeString;
    
    
    NSMutableString *classroomString = [[NSMutableString alloc] init];
    [classroomString appendString:@"Classroom:"];
    [classroomString appendString:@" "];
    [classroomString appendString:classroom];
    
    classroomLabel.text = classroomString;
    
    
    NSMutableString *teacherString = [[NSMutableString alloc] init];
    [teacherString appendString:@"Teacher:"];
    [teacherString appendString:@" "];
    [teacherString appendString:teacher];
    
    teacherLabel.text = teacherString;
    
    NSMutableString *assignmentString = [[NSMutableString alloc] init];
    [assignmentString appendString:assignment];
    
    assignmentLabel.text = assignmentString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
