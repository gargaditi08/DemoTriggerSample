//
//  NCContentManager.h
//  Nucleus
//
//  Created by Nikolai Annenkoff on 5/25/17.
//  Copyright © 2017 actv8me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCScratcherState.h"
#import "NCAPIManager.h"
#import "NCApplication.h"
#import "NCContent.h"
#import "NCContentTerms.h"
#import "NCDevice.h"
#import "NCUser.h"
#import "NCSignal.h"
#import "NCScratcherResponse.h"
#import "NCGenericModel.h"


/**
 * Storycard Callback
 */
typedef void (^Storycard)(NSArray <NCStorycard *>*cards, NSError *error);

/**
 * Wallet Callback
 */
typedef void (^Wallet)(NSArray <NCContent *>*wallet, NSError *error);

/**
 * Scratcher Callback, additional wallet information attached for convienence
 */
typedef void (^Scratcher)(NSArray <NCContent *>*wallet, NSArray <NCContent *>*scratchers, NCScratcherState *state, NSError *error);

/**
 * Singleton Manager for content network request, and content management and synchronization
 */
@interface NCContentManager : NSObject

/**
 * Scratchers referrence handled within manager do no modify
 */
@property (nonatomic, strong) NSMutableArray <NCContent *>*scratchers;

/**
 * Wallet referrence handled within manager do no modify
 */
@property (nonatomic, strong) NSMutableArray <NCContent *>*wallet;

/**
 * Storycard referrence handled within manager do no modify
 */
@property (nonatomic, strong) NSArray <NCStorycard *>*storycards;
@property (nonatomic) NCScratcherState *scratcherState;

+ (id)sharedManager;

#pragma mark - CRUD Methods for Wallet

/**
 * Catch content from a signal <br>
 * content returned in a wallet array
 */
+ (void)contentCatch:(NCSignal *)signal callback:(Wallet)callback;

/**
 * Get all content already caught <br>
 * content returned in a wallet array
 */
+ (void)contentGetAndFilter:(NCContentStatus *)status Callback:(Wallet)callback;

/**
 * Update content from a signal <br>
 * updates the server with the current state of the content
 */
+ (void)contentUpdate:(NCContent *)content status:(NCContentStatus *)status;

/**
 * Insert content from a signal <br>
 * content returned in a wallet array
 */
+ (void)contentInsert:(NCContent *)content callback:(Wallet)callback;

/**
 * Delete content from a signal <br>
 * content returned in a wallet array
 */
+ (void)contentDelete:(NCContent *)content callback:(Wallet)callback;

#pragma mark - Content State Methods

/**
 * Reset the State of the scratchers
 */
+ (void)resetScratcherState;

/**
 * Remove all entries in the wallet
 */
+ (void)clearWallet;

/**
 * Remove all entries in scratchers
 */
+ (void)clearScratchers;

#pragma mark - CRUD Methods

/**
 * Get all available scratchers <br>
 * scratchers return in scratcher array
 */
+ (void)scratchersGetCallback:(Scratcher)callback;

/**
 * Catch all available scratchers <br>
 * Catching a scratcher delivers the internal content for a scratcher <br>
 * scratchers return in scratcher array
 */
+ (void)scratchersCatch:(NSUInteger)count callback:(Scratcher)callback;

/**
 * Reveal a scratcher <br>
 * internal call that manages the interal scratcher count <br>
 * scratchers return in scratcher array
 */
+ (void)scratcherRevealed:(NCContent *)content callback:(Scratcher)callback;

/**
 * Share to social media about mobii, call the method on completion to recieve additional scratcher <br>
 * additional scratchers return in scratcher callabck
 */
+ (void)scratchersShareCallback:(void (^)(NCScratcherState *content, NSError *error))callback;

/**
 * Debug method to reset scratchers to an "unscratched" state
 */ 
+ (void)scratchersResetCallback:(Scratcher)callback;

#pragma mark - Get Storycard

/**
 * Get all available storycards <br>
 * storycards are returned in storycard array
 */
+ (void)storycardGetCallback:(Storycard)callback;

#pragma mark - Media Content

/**
 * retrieve a image related to content <br>
 * returns an image
 */
+ (void)loadImageFrom:(NSURL *)url callback:(void (^)(UIImage *image))callback;

@end
