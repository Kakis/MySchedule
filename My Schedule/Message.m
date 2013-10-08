//
//  Message.m
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Message.h"

@implementation Message


- (id)init
{

    return [self initWithTitle:@""
                       subject:@""
                        sender:@""
                      receiver:@""
                          type:@""
                       message:@""];
}

-(id)initWithTitle:(NSString *)title
           subject:(NSString *)subject
            sender:(NSString *)sender
          receiver:(NSString *)receiver
              type:(NSString *)type
           message:(NSString *)message
{
    self = [super init];
    
    if (self) {
        self.title = title;
        self.subject = subject;
        self.sender = sender;
        self.receiver = receiver;
        self.type = type;
        self.message = message;
    }
    return self;
}

-(NSUInteger)hash
{
    return 37 * [self.id hash];
}


//-(BOOL)isEqual:(id)message
//{
//    if (message == self)
//    {
//        return YES;
//    }
//    if (message && [message isMemberOfClass:[self class]])
//    {
//        return [[message id] isEqualToString:self.id];
//    }
//    return NO;
//}


@end
