//
//  NCAPIManager.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/4/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import "NCSessionManager.h"
#import "NCAPIManager.h"
#import "NCApplication.h"
#import "NCContent.h"
#import "NCContentTerms.h"
#import "NCDevice.h"
#import "NCUser.h"
#import "NCSignal.h"
#import "NCScratcherResponse.h"
#import "NCScratcherState.h"
#import "NCStorycard.h"
#import "NCGeofence.h"
#import "NCGenericModel.h"
#import "NCEmail.h"

typedef NS_ENUM(NSUInteger, NCRequestType) {
    NCRequestTypeGET,
    NCRequestTypePOST,
    NCRequestTypePUT,
    NCRequestTypeDELETE
};

@interface NCPoint : NCGenericModel

@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;

@end

@interface NCTrackedObject : NCGenericModel

@property (strong, nonatomic) NSNumber *timestamp;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSNumber *code;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NCPoint *location;

@end

@interface NCAPIManager : NCSessionManager

@property (nonatomic) BOOL logRequests;

- (NSURLSessionDataTask *)request:(NCRequestType)type
                              url:(NSString *)URLString
                       parameters:(id)parameters
                          success:(void (^)(id))success
                          failure:(void (^)(NSError *))failure;

#pragma mark - Getters / Setters

/**
 * Base URL to make rquest
 */
+ (void)setBaseUrl:(NSString *)url;
+ (NSString *)baseUrl;

/**
 * Required <br>
 * API Key for the SDK
 */
+ (void)setAPIKey:(NSString *)key;
+ (NSString *)APIKey;

/**
 * This doesn't need to be set manually <br>
 * The user object is handler in the API Request
 */
+ (void)setUser:(NCUser *)user; 
+ (NCUser *)user;

/**
 * Current Application State
 */
+ (NCApplication *)application;

@end

@interface NCAPIManager (Utility)

/**
 * Manually Update the application instance
 */
+ (void)updateInstance:(NCApplication *)application;

/**
 * Manually Update the application instance
 */
+ (void)updateInstance:(NCApplication *)application callback:(void (^)(NSError *error))callback;

@end

@interface NCAPIManager (User)

/**
 * User Log in <br>
 * Updates Application instance <br>
 * Sets user object / stores user object on disk
 */
+ (void)login:(NCUser *)user callback:(void (^)(id response, NSError *error))callback;

/**
 * User Log out <br>
 * Updates Application instance <br>
 * Removes user object / removes user object from disk
 */
+ (void)logout:(void (^)(NSError *error))callback;

/**
 * Registers user <br>
 * Updates Application instance <br>
 * Sets user object <br>
 * must call log in method after
 */
+ (void)registerUser:(NCUser *)user callback:(void (^)(NSError *error))callback;

/**
 * Updates user <br>
 * Sets the new user object / stores new user object on disk
 */
+ (void)updateUser:(NCUser *)user callback:(void (^)(NSError *error))callback;

/**
 * Updates user <br>
 * Sets the new user object / stores new user object on disk
 */
+ (void)resetPassword:(NSString *)email callback:(void (^)(NSError *error))callback;

/**
 * Writes the User object to disk
 */
+ (void)persistUserData;

/**
 * Reads the User object from disk
 */
+ (NCUser *)retrieveUserData;

/**
 * Clear the User object from disk
 */
+ (void)clearUserData;

@end

@interface NCAPIManager (Device)

/**
 * Creates a new device on the server
 */
+ (void)createDevice:(void (^)(NSError *error))callback;

/**
 * Updates a created device
 */
+ (void)updateDevice:(void (^)(NSError *error))callback;

@end

@interface NCAPIManager (Content)

/**
 * Catch content from a signal
 */
+ (void)catchTrigger:(NCSignal *)trigger callback:(void (^)(NSArray <NCContent *>*content, NSError *error))callback;

/**
 * Get all content
 */
+ (void)contentGetAndFilterBy:(NCContentStatus *)status callback:(void (^)(NSArray <NCContent *>*responseModel, NSError *error))callback;

/**
 * Update content with a status
 */
+ (void)contentUpdate:(NCContent *)content status:(NCContentStatus *)status;

/**
 * Insert content into wallet
 */
+ (void)contentInsert:(NCContent *)content callback:(void (^)(NSError *error))callback;

/**
 * Delete content from wallet
 */
+ (void)contentDelete:(NCContent *)content callback:(void (^)(NSError *error))callback;

/**
 * Get content terms
 */
+ (void)contentTerms:(NCContent *)content callback:(void (^)(NCContentTerms *content, NSError *error))callback;

@end

@interface NCAPIManager (Storycards)

/**
 * Get all storycards
 */
+ (void)storycardsCallback:(void (^)(NSArray <NCStorycard *>*responseModel, NSError *error))callback;

@end

@interface NCAPIManager (Scratchers)

/**
 * Get all scratchers
 */
+ (void)scratchersCallback:(void (^)(NSDictionary *responseModel, NSError *error))callback;

/**
 * Get content for a number of scratchers
 */
+ (void)scratchersCatch:(NSUInteger)count callback:(void (^)(NSDictionary *content, NSError *error))callback;

/**
 * Share to social media about mobii, call the method on completion to recieve additional scratcher <br>
 * additional scratchers return in scratcher callabck
 */
+ (void)scratchersShareCallback:(void (^)(NCScratcherState *content, NSError *error))callback;

/**
 * Debug method to reset scratchers to an "unscratched" state
 */
+ (void)scratchersResetCallback:(void (^)(NSDictionary *content, NSError *error))callback;

@end

@interface NCAPIManager (Geofences)

/**
 * Get all nearby geofences
 */
+ (void)geofencesDistance:(NSNumber *)meters callback:(void (^)(NCGeofenceState *state, NSArray <NCGeofence *> *, NSError *error))callback;

@end
