//
//  NewLessonServiceViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "NewLessonServiceViewController.h"
#import "Lesson+Json.h"
#import "Lesson.h"
#import "EditCourseViewController.h"

@interface NewLessonServiceViewController ()

@end

@implementation NewLessonServiceViewController

@synthesize allDays, allWeeks, allLessontimes, chosenLessonCourse, lessonType, course, assignment, classroom, day, lessontime, name, subject, teacher, week, setAssignmentTextfield, setClassroomTextfield, setSubjectTextfield, setTeacherTextfield,saveLessonButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    NSMutableString *newLessonTitle = [[NSMutableString alloc] init];
    [newLessonTitle appendString:@"Create a new "];
    [newLessonTitle appendString:chosenLessonCourse];
    [newLessonTitle appendString:@"-lesson"];
    
    newLessonTitleLabel.text = [NSString stringWithString:newLessonTitle];
    
    allDays = [[NSArray alloc] initWithObjects:@"monday", @"tuesday", @"wednesday", @"thursday", @"friday", nil];
    day = @"monday"; // Default value for day
    
    allWeeks = [[NSArray alloc] initWithObjects:@"week 21", @"week 22", @"week 23", nil];
    week = @"21"; // Default value for week
    
    allLessontimes = [[NSArray alloc] initWithObjects:@"08:00", @"09:00", @"10:00", @"13:00", @"14:00", nil];
    lessontime = @"08:00"; // Default value for lessontime
    
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
        return allDays.count;
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
    subject = setSubjectTextfield.text;
    NSLog(@"Subject was changed to: %@", subject);
}


- (IBAction)dissmissClassroomKeyboard:(id)sender
{
    [sender resignFirstResponder];
    classroom = setClassroomTextfield.text;
    NSLog(@"Classroom was changed to: %@", classroom);

}


- (IBAction)dissmissTeacherKeyboard:(id)sender
{
    [sender resignFirstResponder];
    teacher = setTeacherTextfield.text;
    NSLog(@"Techer was changed to: %@", teacher);
}


- (IBAction)dissmissAssignmentKeyboard:(id)sender
{
    [sender resignFirstResponder];
    assignment = setAssignmentTextfield.text;
    NSLog(@"Assignment was changed to: %@", assignment);
}


- (void)saveLesson:(Lesson *)lesson
{
    NSDictionary *lessonAsJson = [self serializeLessonToJson:lesson];
    NSData *lessonAsData = [NSJSONSerialization dataWithJSONObject:lessonAsJson options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:5984/schedule_lessons"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:lessonAsData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id)serializeLessonToJson:(id) object
{
    NSObject *result = [[NSObject alloc] init];
    result = [object jsonValue];
    return result;
}


- (IBAction)saveLessonButton:(id)sender {
    
    // We first check that all textfields have been set with some data.
    // The UIPicker-components day, week and lessontime shuld also have been set to some data.
    
    if ([setSubjectTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([setClassroomTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([setTeacherTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([setAssignmentTextfield.text isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([day isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([week isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
        
    } else if ([lessontime isEqual: @""])
        
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert"
                                                       message:@"Please fill in all of the required fields"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        
        NSLog(@"Please fill in all of the required fields");
        [alert show];
    } else {
    
        name = @"myLesson";
        lessonType = @"lesson";
        course = chosenLessonCourse;
        subject = setSubjectTextfield.text;
        classroom = setClassroomTextfield.text;
        teacher = setTeacherTextfield.text;
        assignment = setAssignmentTextfield.text;
        //// day, week and lessontime is set from strings:
        //// pickedDayString, pickedWeekString, pickedLessonTimeString in pickerView-method

        Lesson *myLesson = [[Lesson alloc] initWithAssignment:assignment
                                                    classroom:classroom
                                                       course:course
                                                          day:day
                                                   lessontime:lessontime
                                                         name:name
                                                      subject:subject
                                                      teacher:teacher
                                                         type:lessonType
                                                         week:week];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@""
                                                       message:@"New Lesson Created"
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        

        [alert show];
        
        [saveLessonButton setHighlighted:NO];
        setSubjectTextfield.text = @"";
        setClassroomTextfield.text = @"";
        setTeacherTextfield.text = @"";
        setAssignmentTextfield.text = @"";

        [self saveLesson:myLesson];

    }
}


@end
