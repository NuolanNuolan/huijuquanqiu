/*
 * Copyright (C) 2014. HUBBox
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "HUBGlobals.h"
#import "HUBClient.h"

@interface HUBUser : NSObject <NSCoding>

@property (nonatomic, copy) NSString *authenticationToken;
@property (nonatomic, copy) NSString *pushNotificationToken;
@property (nonatomic, assign) BOOL pushEnabled;
@property (nonatomic, copy) NSDictionary *roles;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) NSMutableDictionary *visibleByTheUser;
@property (nonatomic, strong) NSMutableDictionary *visibleByFriends;
@property (nonatomic, strong) NSMutableDictionary *visibleByRegisteredUsers;
@property (nonatomic, strong) NSMutableDictionary *visibleByAnonymousUsers;

- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (NSString *) jsonString;
- (NSString *) username;
- (NSString *) phone;

// login/logout
+ (void) loginWithUsername:(NSString *)username password:(NSString *)password completion:(HUBBooleanResultBlock)completionHandler;

+ (void) loginWithPhone:(NSString *)phone password:(NSString *)password completion:(HUBBooleanResultBlock)completionHandler;

+ (void) logoutWithCompletion:(HUBBooleanResultBlock)completionBlock;

// load
+ (void) loadCurrentUserWithCompletion:(HUBObjectResultBlock)completionBlock;
+ (void) loadUsersWithParameters:(NSDictionary *)parameters completion:(HUBArrayResultBlock)completionBlock;
+ (void) loadUserDetails:(NSString *)username completion:(HUBObjectResultBlock)completionBlock;
+ (void) loadRandomUserWithCompletion:(HUBArrayResultBlock)completionBlock;

// Social
+ (void) loginWithFacebookToken:(NSString *)token completion:(HUBBooleanResultBlock)completionBlock;
- (void) linkToFacebookWithToken:(NSString *)token completion:(HUBBooleanResultBlock)completionBlock;
- (void) unlinkFromFacebookWithCompletion:(HUBBooleanResultBlock)completionBlock;
+ (void) loginWithGoogleToken:(NSString *)token completion:(HUBBooleanResultBlock)completionBlock;
- (void) linkToGoogleWithToken:(NSString *)token completion:(HUBBooleanResultBlock)completionBlock;
- (void) unlinkFromGoogleWithCompletion:(HUBBooleanResultBlock)completionBlock;
- (void) fetchLinkedSocialNetworksWithCompletion:(HUBArrayResultBlock)completionBlock;

// update
- (void) updateWithCompletion:(HUBObjectResultBlock)completionBlock;

// Follow/unfollow
- (void) loadFollowingWithCompletion:(HUBArrayResultBlock)completionBlock;
- (void) loadFollowersWithCompletion:(HUBArrayResultBlock)completionBlock;
+ (void) followUser:(HUBUser *)user completion:(HUBObjectResultBlock)completionBlock;
+ (void) unfollowUser:(HUBUser *)user completion:(HUBBooleanResultBlock)completionBlock;

// Password
- (void) changeOldPassword:(NSString *)oldPassword toNewPassword:(NSString *)newPassword completionBlock:(HUBBooleanResultBlock)completionBlock;
- (void) resetPasswordWithCompletion:(HUBBooleanResultBlock)completionBlock;

@end
