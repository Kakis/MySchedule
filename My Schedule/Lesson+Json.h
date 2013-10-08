//
//  Lesson+Json.h
//  MyScheme
//
//  Created by Team SEA: Amelie Sjöstrand Gereholt, Ashraf Jibrael, Emma Boquist,
//  Jens Hagfeldt, Joanna Hemmingsson, Kristoffer Bergkvist. All rights reserved.
//

#import "Lesson.h"
#import "JsonFormat.h"

@interface Lesson (Json) <JsonFormat>

-(id)jsonValue;

@end
