//
//  WeekViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "WeekViewController.h"
#import "MasterViewController.h"
#import "DayViewController.h"
#import "MessageViewController.h"


// URL for the databases
//static NSString * const urlForLessons = @"http://kakis.iriscouch.com/schedule_lessons/_design/";
//static NSString * const urlForMessages = @"http://kakis.iriscouch.com/schedule_messages/_design/";
static NSString * const urlForLessons = @"http://127.0.0.1:5984/schedule_lessons/_design/";
static NSString * const urlForMessages = @"http://127.0.0.1:5984/schedule_messages/_design/";

// Views for sorting lessons
static NSString * const viewIosScheduleForWeek = @"ios_week_schedule/_list/lessons/ios_schedule_for_week";
static NSString * const viewObjectiveCScheduleForWeek = @"objective_c_week_schedule/_list/lessons/objective_c_schedule_for_week";

// Views for sorting messages
static NSString * const viewPrivateMessages = @"private_message/_list/messages/messages_for?key=";
static NSString * const viewMessagesForiOSCourse = @"course_message/_list/messages/ios_course_message";
static NSString * const viewMessagesForObjectiveCCourse = @"course_message/_list/messages/objective_c_course_message";


@implementation WeekViewController


@synthesize chosenStudent, chosenStudentsCourse, assignments, classrooms, courses, days, lessonNames, lessonTimes, subjects, teachers, weeks, messageSubjects, messageSenders, messageReceivers, messages, weekView;

@synthesize section1LessonSubjectTitles = _section1LessonSubjectTitles;
@synthesize section1LessonTimeTitles = _section1LessonTimeTitles;
@synthesize section2MessageSubjectTitles = _section2MessageSubjectTitles;
@synthesize section2MessageSenderNames = _section2MessageSenderNames;


#pragma mark - All Get methods

-(void)getAllLessonsForCourseOnCompletion:(GetCourseResponse)getLessonResponse
{
    NSMutableString *strUrl = [[NSMutableString alloc]initWithString:urlForLessons];
    
    if ([chosenStudentsCourse isEqualToString:@"iOS"])
    {
        [strUrl appendString:viewIosScheduleForWeek];
    }
    else if ([chosenStudentsCourse isEqualToString:@"Objective C"])
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


-(void)getPrivateMessagesForStudentOnCompletion:(GetMessageResponse)getMessageResponse
{
    NSMutableString *strUrl = [[NSMutableString alloc]initWithString:urlForMessages];
    
    [strUrl appendString:viewPrivateMessages];
    [strUrl appendString:@"%22"];
    [strUrl appendString:chosenStudent];
    [strUrl appendString:@"%22"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:strUrl]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *responseBody, NSData *data, NSError *error) {
                               
                               NSArray *getAll= @[data];
                               getMessageResponse(getAll);
                               
                           }];
}


-(void)getMessagesForStudentsInCourseOnCompletion:(GetMessageResponse)getMessageResponse
{
    NSMutableString *strUrl = [[NSMutableString alloc]initWithString:urlForMessages];
    
    if ([chosenStudentsCourse isEqualToString:@"iOS"])
    {
        [strUrl appendString:viewMessagesForiOSCourse];
        
    } else {
        
        [strUrl appendString:viewMessagesForObjectiveCCourse];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:strUrl]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *responseBody, NSData *data, NSError *error) {
                               
                               NSArray *getAll= @[data];
                               getMessageResponse(getAll);
                               
                           }];
}

# pragma mark - View will appear

- (void)viewWillAppear:(BOOL)animated
{
    //--- Vi sätter den valda studentens namn som titel på vyn ------------------//
    self.title = [NSString stringWithFormat:@"%@", chosenStudent];
    
    //--- Lesson arrays -------------//
    assignments = [NSMutableArray new];
    classrooms = [NSMutableArray new];
    courses = [NSMutableArray new];
    days = [NSMutableArray new];
    lessonNames = [NSMutableArray new];
    lessonTimes = [NSMutableArray new];
    subjects = [NSMutableArray new];
    teachers = [NSMutableArray new];
    weeks = [NSMutableArray new];
    
    //--- Message arrays ---------------//
    messageSubjects = [NSMutableArray new];
    messageSenders = [NSMutableArray new];
    messageReceivers = [NSMutableArray new];
    messages = [NSMutableArray new];
    
    //--- Strängar för cellerna i WeekViewController --------//
    _section1LessonSubjectTitles = [NSMutableArray array];
    _section1LessonTimeTitles = [NSMutableArray array];
    _section2MessageSubjectTitles = [NSMutableArray array];
    _section2MessageSenderNames = [NSMutableArray array];
    
    [super viewWillAppear:animated];
    
    NSLog(@"About to load all lessons for %@ in %@-course...",chosenStudent, chosenStudentsCourse);
    
    //--------------------------------- LOADING LESSONS --------------------------------------//
    [self getAllLessonsForCourseOnCompletion:^(NSArray *getLessonResponse) {
        
        if (getLessonResponse) {
            
            for (id _id in getLessonResponse){
                id response = [NSJSONSerialization JSONObjectWithData:_id options:0 error:NULL];
                
                NSLog(@"Searching for %@ lessons in course %@", chosenStudent, chosenStudentsCourse);
                NSLog(@"%@",response);
                
                for (int i=0; i < [response count];i++){
                    NSString * week =[[response objectAtIndex:i] valueForKeyPath:@"week"];
                    NSLog(@"%@",week);
                    NSString * assignment =[[response objectAtIndex:i] valueForKeyPath:@"assignment"];
                    NSLog(@"%@",assignment);
                    NSString * course =[[response objectAtIndex:i] valueForKeyPath:@"course"];
                    NSLog(@"%@",course);
                    NSString * classroom =[[response objectAtIndex:i] valueForKeyPath:@"classroom"];
                    NSLog(@"%@",classroom);
                    NSString * day =[[response objectAtIndex:i] valueForKeyPath:@"day"];
                    NSLog(@"%@",day);
                    NSString * lessonName =[[response objectAtIndex:i] valueForKeyPath:@"name"];
                    NSLog(@"%@",lessonName);
                    NSString * lessonTime =[[response objectAtIndex:i] valueForKeyPath:@"lessontime"];
                    NSLog(@"%@",lessonTime);
                    NSString * subject =[[response objectAtIndex:i] valueForKeyPath:@"subject"];
                    NSLog(@"%@",subject);
                    NSString * teacher =[[response objectAtIndex:i] valueForKeyPath:@"teacher"];
                    NSLog(@"%@",teacher);
                    
                    [assignments addObject:assignment];
                    [classrooms addObject:classroom];
                    [courses addObject:course];
                    [days addObject:day];
                    [lessonNames addObject:lessonName];
                    [lessonTimes addObject:lessonTime];
                    [subjects addObject:subject];
                    [teachers addObject:teacher];
                    [weeks addObject:week];
                    
                    //--- Building up cell.textlabel for lesson-cell---------//
                    NSMutableString *lessonSubjectTitle = [NSMutableString new];
                    [lessonSubjectTitle appendString:subject];
                    
                    //--- Building up cell.detailTextlabel for lesson-cell---//
                    NSMutableString *lessonTimeTitle = [NSMutableString new];
                    [lessonTimeTitle appendString:lessonTime];
                    [lessonTimeTitle appendString:@" on "];
                    [lessonTimeTitle appendString:day];
                    [lessonTimeTitle appendString:@" week "];
                    [lessonTimeTitle appendString:week];
                    
                    //--- Adding to section1-LessonTitles-array --------------//
                    [_section1LessonSubjectTitles addObject:lessonSubjectTitle];
                    [_section1LessonTimeTitles addObject:lessonTimeTitle];
                    
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } else {
            
            NSLog(@"No lessons found for student %@ in course %@!", chosenStudent, chosenStudentsCourse);
        }
        
    }];
    
    //-------------------------- LOADING PRIVATE MESSAGES ----------------------//
    [self getPrivateMessagesForStudentOnCompletion:^(NSArray *getMessageResponse) {
        
        if (getMessageResponse) {
            for (id _id in getMessageResponse){
                id response2 = [NSJSONSerialization JSONObjectWithData:_id options:0 error:NULL];
                
                NSLog(@"Searching for %@ messages", chosenStudent);
                NSLog(@"%@",response2);
                
                for (int j=0; j < [response2 count];j++){
                    NSString * messageSubject =[[response2 objectAtIndex:j] valueForKeyPath:@"subject"];
                    NSLog(@"%@",messageSubject);
                    NSString * messageSender =[[response2 objectAtIndex:j] valueForKeyPath:@"sender"];
                    NSLog(@"%@",messageSender);
                    NSString * messageReceiver =[[response2 objectAtIndex:j] valueForKeyPath:@"receiver"];
                    NSLog(@"%@",messageReceiver);
                    NSString * message =[[response2 objectAtIndex:j] valueForKeyPath:@"message"];
                    NSLog(@"%@",message);
                    
                    [messageSubjects addObject:messageSubject];
                    [messageSenders addObject:messageSender];
                    [messageReceivers addObject:messageReceiver];
                    [messages addObject:message];
                    
                    //--- Building up cell.textlabel for message-cell -----------//
                    NSMutableString *subjectTitleOfMessage = [NSMutableString new];
                    [subjectTitleOfMessage appendString:messageSubject];
                    
                    //--- Building up cell.detailTextlabel for message-cell -----//
                    NSMutableString *senderOfMessage = [NSMutableString new];
                    [senderOfMessage appendString:@"To: "];
                    [senderOfMessage appendString:chosenStudent];
                    [senderOfMessage appendString:@" from: "];
                    [senderOfMessage appendString:messageSender];
                    
                    //--- Adding to section2-MessageTitles-array ----------------//
                    [_section2MessageSubjectTitles addObject:subjectTitleOfMessage];
                    [_section2MessageSenderNames addObject:senderOfMessage];
                    
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } else {
            NSLog(@"No private messages found for student %@!", chosenStudent);
        }
        
    }];
    
    //-------------------------- LOADING PUBLIC MESSAGES ------------------------//
    [self getMessagesForStudentsInCourseOnCompletion:^(NSArray *getMessageResponse) {
        
        if (getMessageResponse) {
            for (id _id in getMessageResponse){
                id response3 = [NSJSONSerialization JSONObjectWithData:_id options:0 error:NULL];
                
                NSLog(@"Searching all messages for students in course %@", chosenStudentsCourse);
                NSLog(@"%@",response3);
                
                for (int j=0; j < [response3 count];j++){
                    NSString * messageSubject =[[response3 objectAtIndex:j] valueForKeyPath:@"subject"];
                    NSLog(@"%@",messageSubject);
                    NSString * messageSender =[[response3 objectAtIndex:j] valueForKeyPath:@"sender"];
                    NSLog(@"%@",messageSender);
                    NSString * messageReceiver =[[response3 objectAtIndex:j] valueForKeyPath:@"receiver"];
                    NSLog(@"%@",messageReceiver);
                    NSString * message =[[response3 objectAtIndex:j] valueForKeyPath:@"message"];
                    NSLog(@"%@",message);
                    
                    [messageSubjects addObject:messageSubject];
                    [messageSenders addObject:messageSender];
                    [messageReceivers addObject:messageReceiver];
                    [messages addObject:message];
                    
                    //--- Building up cell.textlabel for message-cell -----------//
                    NSMutableString *subjectTitleOfMessage = [NSMutableString new];
                    [subjectTitleOfMessage appendString:messageSubject];
                    
                    //--- Building up cell.detailTextlabel for message-cell -----//
                    NSMutableString *senderOfMessage = [NSMutableString new];
                    [senderOfMessage appendString:@"To students in course: "];
                    [senderOfMessage appendString:chosenStudentsCourse];
                    [senderOfMessage appendString:@" from: "];
                    [senderOfMessage appendString:messageSender];
                    
                    //--- Adding to section2-MessageTitles-array ----------------//
                    [_section2MessageSubjectTitles addObject:subjectTitleOfMessage];
                    [_section2MessageSenderNames addObject:senderOfMessage];
                    
                }
            }
            
        } else {
            NSLog(@"No public messages found for students in course %@!", chosenStudentsCourse);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
}

# pragma mark - View didi load

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    weekView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    weekView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        queue = [NSOperationQueue new];
    }
    return self;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    int index = 0;
    switch (section) {
        case 0:
            return [_section1LessonSubjectTitles count];
            break;
        case 1:
            return [_section2MessageSubjectTitles count];
            break;
        default:
            break;
    }
    return index;
}


- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section) {
        case 0:
            return @"Schedule";
            break;
        
        case 1:
            return @"Messages";
            break;
            
        default:
            break;
    }
    return sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    tableView.backgroundView = weekView;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure cells labels depending on which section they are in
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [_section1LessonSubjectTitles objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [_section1LessonTimeTitles objectAtIndex:indexPath.row];
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell8"]];
            break;
        case 1:
            cell.textLabel.text = [_section2MessageSubjectTitles objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [_section2MessageSenderNames objectAtIndex:indexPath.row];
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell8"]];
        default:
            break;
            

    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        MessageViewController *messageController = [MessageViewController new];
        
        if (!messageController) {
            messageController = [[MessageViewController alloc] initWithNibName:@"messageController" bundle:nil];
        }
        
        messageController.sender = [messageSenders objectAtIndex:indexPath.row];
        messageController.message = [messages objectAtIndex:indexPath.row];
        messageController.chosenMessage = [messageSubjects objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:messageController animated:YES];
        
    } else {

        DayViewController *dayController = [DayViewController new];
        if (!dayController) {
            dayController = [[DayViewController alloc] initWithNibName:@"dayController" bundle:nil];
        }

        dayController.assignment = [assignments objectAtIndex:indexPath.row];
        dayController.classroom = [classrooms objectAtIndex:indexPath.row];
        dayController.course = [courses objectAtIndex:indexPath.row];
        dayController.day = [days objectAtIndex:indexPath.row];
        dayController.week = [weeks objectAtIndex:indexPath.row];
        dayController.lessonTime = [lessonTimes objectAtIndex:indexPath.row];
        dayController.subject = [subjects objectAtIndex:indexPath.row];
        dayController.teacher = [teachers objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:dayController animated:YES];
        
    }
    
}


@end
