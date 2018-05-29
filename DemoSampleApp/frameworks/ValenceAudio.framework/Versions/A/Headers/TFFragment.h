//
//  TFFragment.h
//  TFSearchSample
//
//  Created by Andrey Brusnikin on 01.07.15.
//  Copyright (c) 2015 Cifrasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TFCrossingRegion;

@interface TFFragment : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * isCurrent;
@property (nonatomic, retain) NSNumber * datHash;
@property (nonatomic, retain) NSNumber * intersectionHash;
@property (nonatomic, retain) NSString * datServerUrl;
@property (nonatomic, retain) NSString * intersectionServerUrl;
@property (nonatomic, retain) NSString * datLocalPath;
@property (nonatomic, retain) NSDate * lastFpUpdate;
@property (nonatomic, retain) NSDate * lastISUpdate;
@property (nonatomic, retain) NSSet *crossingRegions;
@end

@interface TFFragment (CoreDataGeneratedAccessors)

- (void)addCrossingRegionsObject:(TFCrossingRegion *)value;
- (void)removeCrossingRegionsObject:(TFCrossingRegion *)value;
- (void)addCrossingRegions:(NSSet *)values;
- (void)removeCrossingRegions:(NSSet *)values;

@end
