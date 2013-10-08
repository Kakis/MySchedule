//
//  Lesson+Json.m
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Lesson+Json.h"

@implementation Lesson (Json)

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"assignment"] = self.assignment;
    selfAsJson[@"classroom"] = self.classroom;
    selfAsJson[@"course"] = self.course;
    selfAsJson[@"day"] = self.day;
    selfAsJson[@"lessontime"] = self.lessontime;
    selfAsJson[@"name"] = self.name;
    selfAsJson[@"subject"] = self.subject;
    selfAsJson[@"teacher"] = self.teacher;
    selfAsJson[@"type"] = self.type;
    selfAsJson[@"week"] = self.week;
    
    return selfAsJson;
}

@end
