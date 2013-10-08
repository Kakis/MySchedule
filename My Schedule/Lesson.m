//
//  Lesson.m
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

- (id)init
{
    
    return [self initWithAssignment:@"" classroom:@"" course:@"" day:@"" lessontime:@"" name:@"" subject:@"" teacher:@"" type:@"" week:@""];
}

-(id)initWithAssignment:(NSString *) assignment
classroom:(NSString *) classroom
course:(NSString *) course
day:(NSString *) day
lessontime:(NSString *) lessontime
name:(NSString *) name
subject:(NSString *) subject
teacher:(NSString *) teacher
type:(NSString *) type
week:(NSString *) week
{
    self = [super init];
    
    if (self) {
        self.assignment = assignment;
        self.classroom = classroom;
        self.course = course;
        self.day = day;
        self.lessontime = lessontime;
        self.name = name;
        self.subject = subject;
        self.teacher = teacher;
        self.type = type;
        self.week = week;
    }
    return self;
}

-(NSUInteger)hash
{
    return 37 * [self.id hash];
}

@end
