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

@interface HUBObject : NSObject

@property (nonatomic, copy, readonly) NSString *objectId;
@property (nonatomic, assign, readonly) NSInteger version;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSDictionary *acl;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary __attribute((objc_designated_initializer)); // Will be NS_DESIGNATED_INITIALIZER in Xcode6

+ (void) getObjectsWithCompletion:(HUBArrayResultBlock)completionBlock;
+ (void) getObjectsWithParams:(NSDictionary *)parameters completion:(HUBArrayResultBlock)completionBlock;
+ (void) getObjectWithId:(NSString *)objectID completion:(HUBObjectResultBlock)completionBlock;
- (void) saveObjectWithCompletion:(HUBObjectResultBlock)completionBlock;
- (void) saveObjectWithACL:(NSDictionary *)acl completion:(HUBObjectResultBlock)completionBlock;
- (void) deleteObjectWithCompletion:(HUBBooleanResultBlock)completionBlock;
- (void) grantAccessToRole:(NSString *)roleName ofType:(NSString *)accessType completion:(HUBObjectResultBlock)completionBlock;
- (void) grantAccessToUser:(NSString *)username ofType:(NSString *)accessType completion:(HUBObjectResultBlock)completionBlock;
- (void) revokeAccessToRole:(NSString *)roleName ofType:(NSString *)accessType completion:(HUBObjectResultBlock)completionBlock;
- (void) revokeAccessToUser:(NSString *)username ofType:(NSString *)accessType completion:(HUBObjectResultBlock)completionBlock;
+ (void) fetchCountForObjectsWithCompletion:(HUBIntegerResultBlock)completionBlock;
+ (NSString *) assetsEndPoint;
- (NSString *) collectionName;
- (NSDictionary*) objectAsDictionary;
- (NSString *) jsonString;

- (NSArray *)exclude;

// Experimental
+ (void) getRandomObjectsWithParams:(NSDictionary *)parameters bound:(NSInteger)bound completion:(HUBArrayResultBlock)completionBlock;

@end
