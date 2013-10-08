//
//  MasterViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "MasterViewController.h"
#import "WeekViewController.h"
#import "AdminViewController.h"


// Url for database
//static NSString * const urlForStudents = @"http://kakis.iriscouch.com/schedule_students/_design/_students/_list/students/students";
static NSString * const urlForStudents = @"http://127.0.0.1:5984/schedule_students/_design/students/_list/students/students";


@implementation MasterViewController

@synthesize allFirstnames, allLastnames, names, courses, courseNames, admins, masterView;


-(void)getAllStudentsOnCompletion:(GetResponse)response
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:urlForStudents]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *responseBody, NSData *data, NSError *error) {
        
        NSArray *getAll= @[data];
        response(getAll);
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
    // Clearing all data for WeekViewController
    weekController.chosenStudent = nil;
    weekController.chosenStudentsCourse = nil;
    
    [weekController.assignments removeAllObjects];
    [weekController.classrooms removeAllObjects];
    [weekController.courses removeAllObjects];
    [weekController.days removeAllObjects];
    [weekController.lessonNames removeAllObjects];
    [weekController.lessonTimes removeAllObjects];
    [weekController.subjects removeAllObjects];
    [weekController.teachers removeAllObjects];
    [weekController.weeks removeAllObjects];
    
    [weekController.section1LessonSubjectTitles removeAllObjects];
    [weekController.section1LessonTimeTitles removeAllObjects];
    [weekController.section2MessageSenderNames removeAllObjects];
    [weekController.section2MessageSubjectTitles removeAllObjects];

    weekController.title = nil;
}


- (void)viewDidLoad
{
    masterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    masterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    allFirstnames = [NSMutableArray new];
    allLastnames = [NSMutableArray new];
    names = [NSMutableArray new];
    courses = [NSMutableArray new];
    courseNames = [NSMutableArray new];
    admins = [NSMutableArray new];
    
    NSMutableString *admin = [NSMutableString new];
    [admin appendString:@"Admin"];
    [admins addObject:admin];
    
    [super viewDidLoad];
    
    [self getAllStudentsOnCompletion:^(NSArray *getAllStudentsResponse) {
        
    for (id _id in getAllStudentsResponse)
    {
        id response = [NSJSONSerialization JSONObjectWithData:_id options:0 error:NULL];
        
        for (int i=0; i < [response count];i++)
        {
            NSString *firstName =[[response objectAtIndex:i ] valueForKeyPath:@"firstName"];
            NSString *lastName =[[response objectAtIndex:i ] valueForKeyPath:@"lastName"];
            NSString *course =[[response objectAtIndex:i ] valueForKeyPath:@"course"];

            NSMutableString *name = [NSMutableString new];
            [name appendString:firstName];
            [name appendString:@" "];
            [name appendString:lastName];
            
            [names addObject:name];
            [allFirstnames addObject:firstName];
            [allLastnames addObject:lastName];
            [courses addObject:course];
            
            BOOL isPresent =[courseNames containsObject:course];
            if (isPresent == NO)
            {
                [courseNames addObject:course];
            }
        }
    }
        NSLog(@"All firstnames: %@", allFirstnames);
        NSLog(@"All lastnames: %@", allLastnames);
        NSLog(@"All full names: %@", names);
        NSLog(@"All course names: %@", courseNames);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
     }];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Schedule";
        queue = [NSOperationQueue new];
    }
    return self;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int index = 0;
    switch (section) {
        case 0:
            return [names count];
            break;
        case 1:
            return [admins count];
            break;
        default:
            break;
    }
    return index;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Students";
    }
    else if (section == 1)
    {
        return @"Admin";
    }
    return @"title for header";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    tableView.backgroundView = masterView;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
    }
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [names objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [courses objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell9"]];
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = [admins objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell9"]];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        if (!weekController) {
            weekController = [[WeekViewController alloc] initWithNibName:@"WeekViewController" bundle:nil];
        }
        
        weekController.chosenStudent = [allFirstnames objectAtIndex:indexPath.row];
        weekController.chosenStudentsCourse = [courses objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:weekController animated:YES];
        
    }else{
        
        if (!adminController) {
            adminController = [[AdminViewController alloc] initWithNibName:@"AdminViewController" bundle:nil];
            
        }
        
        adminController.allStudents = allFirstnames;
        adminController.allCourses = courseNames;
        
        [self.navigationController pushViewController:adminController animated:YES];
    }
}


@end
