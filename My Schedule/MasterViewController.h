//
//  MasterViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeekViewController;
@class AdminViewController;

typedef void (^GetResponse)(NSArray* getResponses);


@interface MasterViewController : UITableViewController
{
    NSOperationQueue *queue;

    AdminViewController *adminController;
    WeekViewController *weekController;
    
    UIView *masterView;
}

@property (nonatomic, retain) UIView *masterView;

@property (nonatomic, retain) NSMutableArray *allFirstnames;
@property (nonatomic, retain) NSMutableArray *allLastnames;
@property (nonatomic, retain) NSMutableArray *names;
@property (nonatomic, retain) NSMutableArray *courses;
@property (nonatomic, retain) NSMutableArray *courseNames;
@property (nonatomic, retain) NSMutableArray *admins;


-(void)getAllStudentsOnCompletion:(GetResponse)response;


@end
