//
//  NCGeofences.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 6/28/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NCGenericModel.h"

@interface NCGeofenceGeometry : NCGenericModel

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *coordinates;

- (BOOL)isPoint;

@end

@interface NCGeofence : NCGenericModel

@property (nonatomic, strong) NCGeofenceGeometry *geometry;
@property (nonatomic) NSNumber *radius;

- (CLRegion *)region;

@end
