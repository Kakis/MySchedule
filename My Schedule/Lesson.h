//
//  Lesson.h
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Lesson : NSObject

@property (nonatomic, copy) NSString *assignment;
@property (nonatomic, copy) NSString *classroom;
@property (nonatomic, copy) NSString *course;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *lessontime;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy, readonly) NSString *id;


-(id)initWithAssignment:(NSString *) assignment
              classroom:(NSString *) classroom
                 course:(NSString *) course
                    day:(NSString *) day
             lessontime:(NSString *) lessontime
                   name:(NSString *) name
                subject:(NSString *) subject
                teacher:(NSString *) teacher
                   type:(NSString *) type
                   week:(NSString *) week;



@end
