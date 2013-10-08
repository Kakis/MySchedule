//
//  MessageToAllServiceViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "Message+Json.h"

@interface MessageToAllServiceViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *courseNamePicker;
    IBOutlet UITextField *subjectTextField;
    IBOutlet UITextField *messageTextField;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *messageSender;
@property (nonatomic, copy) NSString *courseReceiver;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *writtenMessage;

//--- CoursePicker -------------------------------------------------------------//
@property (nonatomic, strong) NSMutableArray *allCourseNames;
@property (strong, nonatomic) IBOutlet UIPickerView *courseNamePicker;
@property (strong, nonatomic) IBOutlet UILabel *receiverLabel;

//--- Textfields ---------------------------------------------------------------//
@property (strong, nonatomic) IBOutlet UITextField *subjectTextfield;
@property (strong, nonatomic) IBOutlet UITextField *messageTextfield;
@property (strong, nonatomic) IBOutlet UIButton *sendMessageToAllButton;


//--- Database Actions ---------------------------------------------------------//
- (void)saveWrittenMessage:(Message*)message;

//--- Send Button --------------------------------------------------------------//
- (IBAction)sendPublicMessageButton:(id)sender;


@end
