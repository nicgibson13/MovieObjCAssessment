//
//  Movie.h
//  MovieObjCAssessment
//
//  Created by Nic Gibson on 7/5/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, copy, nullable) NSString *image;
@property (nonatomic) float rating;

-(instancetype)initWithTitle:(NSString *)title
                    overview:(NSString *)overview
                       image:(NSString *)image
                      rating:(float)rating;

@end

@interface Movie (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
