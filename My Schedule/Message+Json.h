//
//  Message+Json.h
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Message.h"
#import "JsonFormat.h"

@interface Message (Json) <JsonFormat>

-(id)jsonValue;

@end
