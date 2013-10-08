//
//  EditViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "EditViewController.h"
#import "AdminViewController.h"
#import "EditCourseViewController.h"
@interface EditViewController ()
@end
@implementation EditViewController
{
    NSMutableArray *chooseCourse;
}

@synthesize editView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = [NSString stringWithFormat:@"Edit schedule"];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    editView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    editView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    chooseCourse = [NSMutableArray new];
    [chooseCourse addObject:@"iOS"];
    [chooseCourse addObject:@"Objective C"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return chooseCourse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    tableView.backgroundView = editView;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [chooseCourse objectAtIndex: indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cell8"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        EditCourseViewController *editViewController = [[EditCourseViewController alloc] initWithNibName:@"EditCourseViewController" bundle:nil];
        
        editViewController.chosenCourse = @"iOS";

        [self.navigationController pushViewController:editViewController animated:YES];
        NSLog(@"Picked %@", editViewController.chosenCourse);
        editViewController.title = [NSString stringWithFormat:@"iOS"];
    } else if (indexPath.row == 1){
        EditCourseViewController *editViewController = [[EditCourseViewController alloc] initWithNibName:@"EditCourseViewController" bundle:nil];
        
        editViewController.chosenCourse = @"Objective C";
        
        [self.navigationController pushViewController:editViewController animated:YES];
        editViewController.title = [NSString stringWithFormat:@"Objective C"];
    }
}
@end