//
//  MessageToOneServiceViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "Message+Json.h"

@interface MessageToOneServiceViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *studentNamePicker;
    IBOutlet UITextField *subjectTextField;
    IBOutlet UITextField *messageTextField;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *messageSender;
@property (nonatomic, copy) NSString *receiver;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *writtenMessage;
@property (strong, nonatomic) IBOutlet UIButton *sendPrivateMessageButton;

//--- NamePicker --------------------------------------------------------------------//
@property (nonatomic, strong) NSMutableArray *allStudentNames;
@property (strong, nonatomic) IBOutlet UIPickerView *studentNamePicker;
@property (strong, nonatomic) IBOutlet UILabel *receiverLabel;

//--- Textfields --------------------------------------------------------------------//
@property (strong, nonatomic) IBOutlet UITextField *subjectTextfield;
@property (strong, nonatomic) IBOutlet UITextField *messageTextfield;

//--- Database Actions --------------------------------------------------------------//
- (void)saveWrittenMessage:(Message*)message;

//--- Send Button -------------------------------------------------------------------//
- (IBAction)sendPrivateMessageButton:(id)sender;


@end
