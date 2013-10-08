//
//  MessageViewController.h
//  Mitt Schema
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController


{
    __weak IBOutlet UILabel *senderLabel;
    __weak IBOutlet UILabel *messageLabel;
}

@property (nonatomic, strong)NSString *chosenMessage;
@property (nonatomic, strong)NSString *sender;
@property (nonatomic, strong)NSString *message;


@end
