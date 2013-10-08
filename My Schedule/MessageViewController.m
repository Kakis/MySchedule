//
//  MessageViewController.m
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "MessageViewController.h"
#import "WeekViewController.h"
#import "MasterViewController.h"

@implementation MessageViewController

@synthesize chosenMessage, sender, message;


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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hav2"]];
    self.title = [NSString stringWithFormat:@"%@", chosenMessage];

    
    NSMutableString *senderString = [NSMutableString new];
    [senderString appendString:sender];
    senderLabel.text = senderString;
    
    NSMutableString *messageString = [NSMutableString new];
    [messageString appendString:message];
    messageLabel.text = messageString;
}


@end
