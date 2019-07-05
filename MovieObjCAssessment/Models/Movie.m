//
//  Movie.m
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title
                     overview:(NSString *)overview
                        image:(NSString *)image
                       rating:(float)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _overview = overview;
        _image = image;
        _rating = rating;
    }
    return self;
}

@end

@implementation Movie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *overview = dictionary[@"overview"];
    NSString *image = dictionary[@"poster_path"];
    float rating = [dictionary[@"vote_average"] floatValue];
    if ([image isKindOfClass:[NSNull class]]) {
        image = nil;
    }
    
    return [self initWithTitle:title overview:overview image:image rating:rating];
}

@end
