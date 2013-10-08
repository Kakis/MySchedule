//
//  Message+Json.m
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Message+Json.h"

@implementation Message (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"title"] = self.title;
    selfAsJson[@"subject"] = self.subject;
    selfAsJson[@"sender"] = self.sender;
    selfAsJson[@"receiver"] = self.receiver;
    selfAsJson[@"type"] = self.type;
    selfAsJson[@"message"] = self.message;
    
    return selfAsJson;
}


@end
