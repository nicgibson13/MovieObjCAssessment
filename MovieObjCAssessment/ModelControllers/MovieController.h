//
//  MovieController.h
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"
NS_ASSUME_NONNULL_BEGIN

@interface MovieController : NSObject

// Singleton
+(instancetype)sharedController;

// Source of truth
@property (nonatomic, copy) NSArray<Movie *> *movies;

-(void)fetchMovieWithTerm:(NSString *)term completion:(void (^)(NSArray<Movie *> *))completion;

-(void)fetchImage:(Movie *)movieToFechImage completion: (void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
