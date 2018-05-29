//
//  TFRegion.h
//  TFSearchSample
//
//  Created by Andrey Brusnikin on 25.06.15.
//  Copyright (c) 2015 Cifrasoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Defines.h"

@interface TFCrossingRegion : NSManagedObject

@property (nonatomic, retain) NSNumber * fragmentId;
@property (nonatomic, retain) NSNumber * origin_start;
@property (nonatomic, retain) NSNumber * origin_end;
@property (nonatomic, retain) NSNumber * overlap_start;
@property (nonatomic, retain) NSNumber * overlap_end;

@end

@interface TFCrossingRegion (Crossing)

- (BOOL)isInOrigin:(TFTShift)shift;
- (BOOL)isInOverlap:(TFTShift)shift;

@end
