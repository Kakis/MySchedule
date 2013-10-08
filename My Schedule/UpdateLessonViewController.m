//
//  UpdateLessonViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "UpdateLessonViewController.h"
#import "EditViewController.h"
#import "Lesson.h"
#import "Lesson+Json.h"

@interface UpdateLessonViewController ()

@end

@implementation UpdateLessonViewController

@synthesize allDays, allWeeks, allLessontimes, assignment, classroom, course, day, week, lessontime, lessonName, subject, teacher, type, idet, rev, updateSubjectTextfield, updateClassroomTextfield, updateTeacherTextfield, updateAssignmentTextfield, pickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Setting UIPickerView's day to the selected lessons - day
    int dayIndex = 0;
    if ([day isEqualToString:@"monday"]) {
        dayIndex = 0;
    } else if ([day isEqualToString:@"tuesday"]) {
        dayIndex = 1;
    } else if ([day isEqualToString:@"wednesday"]) {
        dayIndex = 2;
    } else if ([day isEqualToString:@"thursday"]) {
        dayIndex = 3;
    } else { // day isEqualToString:@"friday"
        dayIndex = 4;
    }
    
    [self.pickerView selectRow:dayIndex inComponent:0 animated:YES];
    
    
    // Setting UIPickerView's week to the selected lessons - week
    int weekIndex = 0;
    if ([week isEqualToString:@"21"]) {
        weekIndex = 0;
    } else if ([week isEqualToString:@"22"]) {
        weekIndex = 1;
    } else { // week isEqualToString:@"23"
        weekIndex = 2;
    }
    
    [self.pickerView selectRow:weekIndex inComponent:1 animated:YES];
    
    
    // Setting UIPickerView's lessontime to the selected lessons - lessontime
    int lessontimeIndex = 0;
    if ([lessontime isEqualToString:@"08:00"]) {
        lessontimeIndex = 0;
    } else if ([lessontime isEqualToString:@"09:00"]) {
        lessontimeIndex = 1;
    } else if ([lessontime isEqualToString:@"10:00"]) {
        lessontimeIndex = 2;
    } else if ([lessontime isEqualToString:@"13:00"]) {
        lessontimeIndex = 3;
    } else { // day isEqualToString:@"14:00"
        lessontimeIndex = 4;
    }
    
    [self.pickerView selectRow:lessontimeIndex inComponent:2 animated:YES];
}

- (void)viewDidLoad
{
    updateLessonLabel.text = subject;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    [super viewDidLoad];
    assignmentTextfield.text = assignment;
    classroomTextfield.text = classroom;
    subjectTextfield.text = subject;
    teacherTextfield.text = teacher;
    
    NSLog(@"Time %@", lessontime);
    
    allDays = [[NSArray alloc] initWithObjects:@"monday", @"tuesday", @"wednesday", @"thursday", @"friday", nil];
    
    allWeeks = [[NSArray alloc] initWithObjects:@"week 21", @"week 22", @"week 23", nil];
    
    allLessontimes = [[NSArray alloc] initWithObjects:@"08:00", @"09:00", @"10:00", @"13:00", @"14:00", nil];
    
    [super viewDidLoad];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Return number of components (weeks, days and lessontimes)
    return 3;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    // Return number of rows for weeks, days and time
    if(component == 0) {
        return allDays.count;
    }
    else if(component == 1) {
        return allWeeks.count;
    }
    else {
        return allLessontimes.count;
    }
}


-(UIView *)pickerView:(UIPickerView *)pickerView
           viewForRow:(NSInteger)row
         forComponent:(NSInteger)component
          reusingView:(UIView *)view
{
    if (component == 0) {
        UILabel *pickerLabel = (UILabel *)view;
        // Setting fontsize for labels in component 0
        if (pickerLabel == nil) {
            CGRect frame = CGRectMake(0.0, 0.0, 80, 32);
            pickerLabel = [[UILabel alloc] initWithFrame:frame];
            [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
        }
        [pickerLabel setText:[allDays objectAtIndex:row]];
        return pickerLabel;
    }
    else if (component == 1) {
        UILabel *pickerLabel = (UILabel *)view;
        // Setting fontsize for labels in component 1
        if (pickerLabel == nil) {
            CGRect frame = CGRectMake(0.0, 0.0, 80, 32);
            pickerLabel = [[UILabel alloc] initWithFrame:frame];
            [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
        }
        [pickerLabel setText:[allWeeks objectAtIndex:row]];
        return pickerLabel;
    }
    else { // Component 2
        UILabel *pickerLabel = (UILabel *)view;
        // Setting fontsize for labels in component 2
        if (pickerLabel == nil) {
            CGRect frame = CGRectMake(0.0, 0.0, 80, 32);
            pickerLabel = [[UILabel alloc] initWithFrame:frame];
            [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
        }
        [pickerLabel setText:[allLessontimes objectAtIndex:row]];
        return pickerLabel;
    }
}


- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    // Set labels for all components weeks, days and time
    if (component == 0) {
        return [allDays objectAtIndex:row];
    }
    else if (component == 1) {
        return [allWeeks objectAtIndex:row];
    }
    else { // Component 2
        return [allLessontimes objectAtIndex:row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    // Creating strings for holding the picked rows in pickerView
    NSMutableString *pickedDayString = [[NSMutableString alloc] init];
    NSMutableString *pickedWeekString = [[NSMutableString alloc] init];
    NSMutableString *pickedLessontimeString = [[NSMutableString alloc] init];
    
    if (component == 0) {
        pickedDayString = [allDays objectAtIndex:row];
        day = pickedDayString;
        NSLog(@"Day was set to: %@", day);
    }
    else if (component == 1) {
        pickedWeekString = [allWeeks objectAtIndex:row];
        
        if ([pickedWeekString isEqualToString:@"week 21"]) {
            pickedWeekString = [NSMutableString stringWithString: @"21"];
        }
        else if ([pickedWeekString isEqualToString:@"week 22"]) {
            pickedWeekString = [NSMutableString stringWithString: @"22"];
        }
        else { // [pickedWeekString isEqualToString:@"week 23"]
            pickedWeekString = [NSMutableString stringWithString: @"23"];
        }
        
        week = pickedWeekString;
        NSLog(@"Week was set to: %@", week);
    }
    else { // component 2
        pickedLessontimeString = [allLessontimes objectAtIndex:row];
        lessontime = pickedLessontimeString;
        NSLog(@"Lessontime was set to: %@", lessontime);
    }
}


- (IBAction)dissmissSubjectKeyboard:(id)sender
{
    [sender resignFirstResponder];
    subject = updateSubjectTextfield.text;
    NSLog(@"Subject was changed to: %@", subject);
}


- (IBAction)dissmissClassroomKeyboard:(id)sender
{
    [sender resignFirstResponder];
    classroom = updateClassroomTextfield.text;
    NSLog(@"Classroom was changed to: %@", classroom);
}


- (IBAction)dissmissTeacherKeyboard:(id)sender
{
    [sender resignFirstResponder];
    teacher = updateTeacherTextfield.text;
    NSLog(@"Techer was changed to: %@", teacher);
}

- (IBAction)dissmissAssignmentKeyboard:(id)sender
{
    [sender resignFirstResponder];
    assignment = updateAssignmentTextfield.text;
    NSLog(@"Assignment was changed to: %@", assignment);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButton:(id)sender {
    
    // We first check that all textfields have been set with some data
    
    if ([updateSubjectTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([updateClassroomTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([updateTeacherTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([updateAssignmentTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    }
    
    assignment = assignmentTextfield.text;
    classroom = classroomTextfield.text;
    subject = subjectTextfield.text;
    teacher = teacherTextfield.text;

    Lesson *myLesson = [[Lesson alloc] initWithAssignment:assignment
                                                classroom:classroom
                                                   course:course
                                                      day:day
                                               lessontime:lessontime
                                                     name:lessonName
                                                  subject:subject
                                                  teacher:teacher
                                                     type:type
                                                     week:week];
    
    [self updateLesson:myLesson :idet :rev];
    
}


- (void)updateLesson:(Lesson *)aLesson :(NSString *)courseId :(NSString *)revNumber
{
    NSDictionary *lessonAsJson = [self serializeCourseToJson:aLesson];
    NSData *courseAsData = [NSJSONSerialization dataWithJSONObject:lessonAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://127.0.0.1:5984/schedule_lessons/%@?rev=%@", courseId, revNumber]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:courseAsData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
}

-(id)serializeCourseToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}


@end
