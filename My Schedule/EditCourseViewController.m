//
//  EditCourseViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "EditCourseViewController.h"
#import "MasterViewController.h"
#import "WeekViewController.h"
#import "EditViewController.h"
#import "NewLessonServiceViewController.h"
#import "UpdateLessonViewController.h"


// URL for the lessons database
static NSString * const urlForLessons = @"http://127.0.0.1:5984/schedule_lessons/_design/";

// Views for sorting schedule
static NSString * const viewIosScheduleForWeek = @"ios_week_schedule/_list/lessons/ios_schedule_for_week";
static NSString * const viewObjectiveCScheduleForWeek = @"objective_c_week_schedule/_list/lessons/objective_c_schedule_for_week";

@interface EditCourseViewController ()

@end

@implementation EditCourseViewController

@synthesize chosenCourse, assignments, classrooms, courses, days, lessonNames,lessonTimes, subjects, teachers, weeks, courseTypes, ids, revs,lessonSubjectTitles, lessonTimeTitles, editCourseView;


-(void)getAllLessonsForCourse:(NSString*)chosenStudentCourse OnCompletion:(GetLessonResponse)getLessonResponse
{
    NSMutableString *strUrl = [[NSMutableString alloc]initWithString:urlForLessons];
    
    if ([chosenCourse isEqualToString:@"iOS"])
    {
        [strUrl appendString:viewIosScheduleForWeek];
    }
    else if ([chosenCourse isEqualToString:@"Objective C"])
    {
        [strUrl appendString:viewObjectiveCScheduleForWeek];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:strUrl]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *responseBody, NSData *data, NSError *error) {
                               
                               NSArray *getAll= @[data];
                               getLessonResponse(getAll);
                               
                           }];
}

- (void)viewWillAppear:(BOOL)animated
{
    // --- Vi skapar en addNewLesson-knapp längst upp på vyn ---------------------- //
    UIBarButtonItem *addLessonButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                     target:self
                                                                                     action:@selector(addNewLesson:)];
    self.navigationItem.rightBarButtonItem = addLessonButton;
}


- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.rightBarButtonItem = nil;
}


- (void)viewDidLoad
{
    editCourseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    editCourseView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    assignments = [[NSMutableArray alloc] init];
    classrooms = [[NSMutableArray alloc] init];
    courses = [[NSMutableArray alloc] init];
    days = [[NSMutableArray alloc] init];
    lessonNames = [[NSMutableArray alloc] init];
    lessonTimes = [[NSMutableArray alloc] init];
    subjects = [[NSMutableArray alloc] init];
    teachers = [[NSMutableArray alloc] init];
    weeks = [[NSMutableArray alloc] init];
    courseTypes = [[NSMutableArray alloc] init];
    ids = [[NSMutableArray alloc] init];
    revs = [[NSMutableArray alloc] init];
    
    //--- Strängar för cellerna i WeekViewController ----------------------------------//
    lessonSubjectTitles = [[NSMutableArray alloc] init];
    lessonTimeTitles = [[NSMutableArray alloc] init];
    
    
    // --- Vi sätter den valda studentens namn som titel på vyn ---------------------- //
    self.title = [NSString stringWithFormat:@"%@", chosenCourse];
    
    
    [super viewDidLoad];
    
    [self getAllLessonsForCourse:chosenCourse OnCompletion:^(NSArray *getLessonResponse) {
        
        for (id _id in getLessonResponse){
            id response = [NSJSONSerialization JSONObjectWithData:_id options:0 error:NULL];
            
            for (int i=0; i < [response count];i++){
                NSString * week =[[response objectAtIndex:i ] valueForKeyPath:@"week"];
                NSLog(@"%@",week);
                NSString * assignment =[[response objectAtIndex:i ] valueForKeyPath:@"assignment"];
                NSLog(@"%@",assignment);
                NSString * course =[[response objectAtIndex:i ] valueForKeyPath:@"course"];
                NSLog(@"%@",course);
                NSString * classroom =[[response objectAtIndex:i ] valueForKeyPath:@"classroom"];
                NSLog(@"%@",classroom);
                NSString * day =[[response objectAtIndex:i ] valueForKeyPath:@"day"];
                NSLog(@"%@",day);
                NSString * lessonName =[[response objectAtIndex:i ] valueForKeyPath:@"name"];
                NSLog(@"%@",lessonName);
                NSString * lessonTime =[[response objectAtIndex:i ] valueForKeyPath:@"lessontime"];
                NSLog(@"%@",lessonTime);
                NSString * subject =[[response objectAtIndex:i ] valueForKeyPath:@"subject"];
                NSLog(@"%@",subject);
                NSString * teacher =[[response objectAtIndex:i ] valueForKeyPath:@"teacher"];
                NSLog(@"%@",teacher);
                NSString * courseType =[[response objectAtIndex:i ] valueForKeyPath:@"type"];
                NSLog(@"%@",courseType);
                NSString * idet =[[response objectAtIndex:i ] valueForKeyPath:@"_id"];
                NSLog(@"%@",idet);
                NSString * rev =[[response objectAtIndex:i ] valueForKeyPath:@"_rev"];
                NSLog(@"%@",rev);
                
                [assignments addObject:assignment];
                [classrooms addObject:classroom];
                [courses addObject:course];
                [days addObject:day];
                [lessonNames addObject:lessonName];
                [lessonTimes addObject:lessonTime];
                [subjects addObject:subject];
                [teachers addObject:teacher];
                [weeks addObject:week];
                [courseTypes addObject:courseType];
                [ids addObject:idet];
                [revs addObject:rev];
                
                //--- Building up cell.textlabel ----------------------- //
                NSMutableString *lessonSubjectTitle = [NSMutableString new];
                [lessonSubjectTitle appendString:subject];
                
                //--- Building up cell.detailTextlabel ----------------- //
                NSMutableString *lessonTimeTitle = [NSMutableString new];
                [lessonTimeTitle appendString:lessonTime];
                [lessonTimeTitle appendString:@" on "];
                [lessonTimeTitle appendString:day];
                [lessonTimeTitle appendString:@" week "];
                [lessonTimeTitle appendString:week];
                
                [lessonSubjectTitles addObject:lessonSubjectTitle];
                [lessonTimeTitles addObject:lessonTimeTitle];
                
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        queue = [NSOperationQueue new];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lessonSubjectTitles.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Schedule";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    tableView.backgroundView = editCourseView;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [lessonSubjectTitles objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [lessonTimeTitles objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell8"]];
    
    //[headerString appendString:[days objectAtIndex:indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UpdateLessonViewController *updateController = [UpdateLessonViewController new];
    if (!updateController) {
        updateController = [[UpdateLessonViewController alloc] initWithNibName:@"updateController" bundle:nil];
    }
    
    updateController.assignment = [assignments objectAtIndex:indexPath.row];
    updateController.classroom = [classrooms objectAtIndex:indexPath.row];
    updateController.course = [courses objectAtIndex:indexPath.row];
    updateController.day = [days objectAtIndex:indexPath.row];
    updateController.week = [weeks objectAtIndex:indexPath.row];
    updateController.lessontime = [lessonTimes objectAtIndex:indexPath.row];
    updateController.lessonName = [lessonNames objectAtIndex:indexPath.row];
    updateController.subject = [subjects objectAtIndex:indexPath.row];
    updateController.teacher = [teachers objectAtIndex:indexPath.row];
    updateController.type = [courseTypes objectAtIndex:indexPath.row];
    updateController.idet = [ids objectAtIndex:indexPath.row];
    updateController.rev = [revs objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:updateController animated:YES];
}


- (void)addNewLesson:(id)sender
{
    // --- Vi skapar en subvy som heter newLessonController ----- //
    if (!newLessonController) {
        newLessonController = [[NewLessonServiceViewController alloc] initWithNibName:@"NewLessonServiceViewController"
                                                                               bundle:nil];
        
        newLessonController.chosenLessonCourse = chosenCourse;
        newLessonController.lessonType = @"lesson";
        
        [self.navigationController pushViewController:newLessonController
                                             animated:YES];
    }
}


@end
