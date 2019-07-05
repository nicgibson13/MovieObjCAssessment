//
//  Movie.m
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title overview:(NSString *)overview rating:(float)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _overview = overview;
        _rating = rating;
//        _image = image
    }
    return self;
}

@end

@implementation Movie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *overview = dictionary[@"overview"];
    float rating = [dictionary[@"popularity"] floatValue];
    
    return [self initWithTitle:title overview:overview rating:rating];
}

@end
