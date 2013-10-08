//
//  AdminViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "AdminViewController.h"
#import "MasterViewController.h"
#import "EditViewController.h"
#import "MessageToOneServiceViewController.h"
#import "MessageToAllServiceViewController.h"


@implementation AdminViewController

@synthesize allStudents, allCourses;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = [NSString stringWithFormat:@"Admin"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    
    
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)editButton:(id)sender {
    
    if (!editController) {
        editController = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
        
    }
    [self.navigationController pushViewController:editController animated:YES];
}


- (IBAction)oneStudentButton:(id)sender
{
    if (!messageToOne) {
        messageToOne = [[MessageToOneServiceViewController alloc] initWithNibName:@"MessageToOneServiceViewController" bundle:nil];
    }
    
    messageToOne.allStudentNames = allStudents;
    
    [self.navigationController pushViewController:messageToOne animated:YES];
}


- (IBAction)allStudentsButton:(id)sender
{
    if (!messageToAll) {
        messageToAll = [[MessageToAllServiceViewController alloc] initWithNibName:@"MessageToAllServiceViewController" bundle:nil];
    }
    
    messageToAll.allCourseNames = allCourses;
    
    [self.navigationController pushViewController:messageToAll animated:YES];
}


@end
