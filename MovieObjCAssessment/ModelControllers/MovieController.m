//
//  MovieController.m
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import "MovieController.h"

static NSString * const baseURL = @"https://api.themoviedb.org/3/search/movie";
static NSString * const imageBaseURL = @"https://image.tmdb.org/t/p/w500";

@implementation MovieController

+ (instancetype)sharedController
{
    static MovieController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [MovieController new];
    });
    return sharedController;
}

- (void)fetchMovieWithTerm:(NSString *)term completion:(void (^)(NSArray<Movie *> *))completion
{
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"f263ca83d42eba9997e31373d6b38788"];
    NSURLQueryItem *searchTerm = [[NSURLQueryItem alloc] initWithName:@"query" value:@"Star Wars"];
    components.queryItems = @[apiKey, searchTerm];
    NSURL *finalURL = components.URL;
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"There was an error decoding the topLevelDictionary, in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
                completion(nil);
                return;
            }
            NSMutableArray *movieArray = [NSMutableArray new];
            NSArray *secondLevelArray = topLevelDictionary[@"results"];
            for (NSDictionary *currentDictionary in secondLevelArray)
            {
                Movie *movie = [[Movie alloc] initWithDictionary:currentDictionary];
                [movieArray addObject:movie];
            }
            completion(movieArray);
        }
    }] resume];
}

//- (void)fetchImage:(Movie *)movieToFechImage completion:(void (^)(UIImage * _Nonnull))completion

@end
