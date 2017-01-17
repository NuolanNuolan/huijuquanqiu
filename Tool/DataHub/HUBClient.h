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

#import "HUBObject.h"
#import "HUBGlobals.h"
#import "HUBBox.h"
#import "HUBFile.h"
#import "HUBUser.h"

@class HUBFile;
@class HUBUser;

@interface HUBClient : NSObject

@property (nonatomic, strong) HUBUser *currentUser;
@property (nonatomic, strong, readonly) NSURL *baseURL;

+ (instancetype)sharedClient;

// Authentication
- (void)authenticateUser:(NSString *)username
                password:(NSString *)password
              completion:(HUBBooleanResultBlock)completionBlock;


- (void)authenticatePhone:(NSString *)phone
                 password:(NSString *)password
               completion:(HUBBooleanResultBlock)completionHandler;


- (void)createUserWithUsername:(NSString *)username
                      password:(NSString *)password
                    completion:(HUBBooleanResultBlock)completionBlock;

- (void)createUserWithUsername:(NSString *)username
                      password:(NSString *)password
              visibleByTheUser:(NSDictionary *)visibleByTheUser
              visibleByFriends:(NSDictionary *)visibleByFriends
      visibleByRegisteredUsers:(NSDictionary *)visibleByRegisteredUsers
       visibleByAnonymousUsers:(NSDictionary *)visibleByAnonymousUsers
                    completion:(HUBBooleanResultBlock)completionBlock;


- (void)createUserWithPhone:(NSString *)phone
                   authCode:(NSString*) authCode
                   password:(NSString *)password
                 completion:(HUBBooleanResultBlock)completionHandler;

- (void)createUserWithPhone:(NSString *)phone
                   authCode:(NSString*) authCode
                   password:(NSString *)password
           visibleByTheUser:(NSDictionary *)visibleByTheUser
           visibleByFriends:(NSDictionary *)visibleByFriends
   visibleByRegisteredUsers:(NSDictionary *)visibleByRegisteredUsers
    visibleByAnonymousUsers:(NSDictionary *)visibleByAnonymousUsers
                 completion:(HUBBooleanResultBlock)completionHandler;

- (BOOL) isAuthenticated;

- (void) logoutWithCompletion:(HUBBooleanResultBlock)completionBlock;


// Auth Code

- (void)getSignUpAuthCode:(NSString *)phone
               completion:(HUBBooleanResultBlock)completionHandler;

- (void)getLostPasswordAuthCode:(NSString *)phone
                     completion:(HUBBooleanResultBlock)completionHandler ;

- (void)getAuthCodeWithPhone:(NSString *)phone
                        type:(int) type
                  completion:(HUBBooleanResultBlock)completionHandler;


// Loading
- (void) loadObject:(HUBObject *)object completion:(HUBObjectResultBlock)completionBlock;
- (void) loadCollection:(HUBObject *)object completion:(HUBArrayResultBlock)completionBlock;
- (void) loadCollection:(HUBObject *)object withParams:(NSDictionary *)parameters completion:(HUBArrayResultBlock)completionBlock;

// saving
- (void) createObject:(HUBObject *)object completion:(HUBObjectResultBlock)completionBlock;
- (void) updateObject:(HUBObject *)object completion:(HUBObjectResultBlock)completionBlock;

// Deleting
- (void) deleteObject:(HUBObject *)object completion:(HUBBooleanResultBlock)completionBlock;

// Counting
- (void) fetchCountForObjects:(HUBObject *)object completion:(HUBIntegerResultBlock)completionBlock;

// Push notifications
- (void) askToEnablePushNotifications;
- (void) enablePushNotifications:(NSData *)token completion:(HUBBooleanResultBlock)completionBlock;
- (void) disablePushNotificationsWithCompletion:(HUBBooleanResultBlock)completionBlock;
- (void) pushNotificationToUsername:(NSString *)username withMessage:(NSString *)message completion:(HUBBooleanResultBlock)completionBlock;
- (void) pushNotificationToUsername:(NSString *)username withMessage:(NSString *)message customPayload:(NSDictionary *)customPayload completion:(HUBBooleanResultBlock)completionBlock;

// Files
- (void) loadFiles:(HUBFile *)file completion:(HUBArrayResultBlock)completionBlock;
- (void) loadFiles:(HUBFile *)file withParams:(NSDictionary *) parameters completion:(HUBArrayResultBlock)completionBlock;
- (NSURLSessionDataTask *) loadFileData:(HUBFile *)file completion:(void(^)(NSData *data, NSError *error))completionBlock;
- (NSURLSessionDataTask *) loadFileData:(HUBFile *)file parameters:(NSDictionary *)parameters completion:(void(^)(NSData *data, NSError *error))completionBlock;
- (void) uploadFile:(HUBFile *)file withPermissions:(NSDictionary *)permissions completion:(HUBObjectResultBlock)completionBlock;
- (void) deleteFile:(HUBFile *)file completion:(HUBBooleanResultBlock)completionBlock;
- (void) loadFileDetails:(NSString *)fileID completion:(HUBObjectResultBlock)completionBlock;
- (void) loadFilesAndDetailsWithCompletion:(HUBArrayResultBlock)completionBlock;

// User
- (void) loadCurrentUserWithCompletion:(HUBObjectResultBlock)completionBlock;
- (void) updateUserWithCompletion:(HUBObjectResultBlock)completionBlock;
- (void) loadUsersWithCompletion:(HUBArrayResultBlock)completionBlock;
- (void) loadUsersWithParameters:(NSDictionary *)parameters completion:(HUBArrayResultBlock)completionBlock;
- (void) loadUsersDetails:(NSString *) userId completion:(HUBObjectResultBlock)completionBlock;
- (void) loadFollowingForUser:(HUBUser *)user completion:(HUBArrayResultBlock)completionBlock;
- (void) loadFollowersOfUser:(HUBUser *)user completion:(HUBArrayResultBlock)completionBlock;
- (void) followUser:(HUBUser *)user completion:(HUBObjectResultBlock)completionBlock;
- (void) unfollowUser:(HUBUser *)user completion:(HUBBooleanResultBlock)completionBlock;

// Acl
- (void) grantAccess:(id)element toRole:(NSString *)roleName accessType:(NSString *)access completion:(HUBObjectResultBlock)completionBlock;
- (void) grantAccess:(id)element toUser:(NSString *)username accessType:(NSString *)access completion:(HUBObjectResultBlock)completionBlock;
- (void) revokeAccess:(id)element toRole:(NSString *)roleName accessType:(NSString *)access completion:(HUBObjectResultBlock)completionBlock;
- (void) revokeAccess:(id)element toUser:(NSString *)username accessType:(NSString *)access completion:(HUBObjectResultBlock)completionBlock;

// Password
- (void) changeOldPassword:(NSString *)oldPassword toNewPassword:(NSString *)newPassword completion:(HUBBooleanResultBlock)completionBlock;
- (void) resetPasswordForUsername:(NSString *)username withCompletion:(HUBBooleanResultBlock)completionBlock;
- (void)changePasswordWithPhone:(NSString *)phone
                       password:(NSString *)password
                       authCode:(NSString*) authCode
                     completion:(HUBBooleanResultBlock)completionHandler;


// Admin
- (void) createCollection:(NSString *)collectionName completion:(HUBObjectResultBlock)completionBlock;
- (void) loadSettingsWithCompletion:(HUBObjectResultBlock)completionBlock;
- (void) loadSettingsSection:(NSString *)sectionName completion:(HUBObjectResultBlock)completionBlock;
- (void) setValue:(NSString *)value forKey:(NSString *)key inSection:(NSString *)sectionName completion:(HUBObjectResultBlock)completionBlock;


// Core methods
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;

- (void)putPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;
    
- (void)deletePath:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;

- (void) saveUserToDisk:(HUBUser *)user;

// Pagination constants
extern NSString * const kPageNumberKey;
extern NSString * const kPageSizeKey;
extern NSInteger const kPageLength;

// Role constants
extern NSString * const kAclAnonymousRole;
extern NSString * const kAclRegisteredRole;
extern NSString * const kAclAdministratorRole;

// ACL constants
extern NSString * const kAclReadPermission;
extern NSString * const kAclDeletePermission;
extern NSString * const kAclUpdatePermission;
extern NSString * const kAclAllPermission;

// Push Notification constants
extern NSString * const kPushNotificationMessageKey;
extern NSString * const kPushNotificationCustomPayloadKey;

// Authentication expired notification
extern NSString * const kAuthenticationTokenExpiredNotification;

@end