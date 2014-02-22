//
//  SimulatorRemoteNotificationsExampleTests.m
//  SimulatorRemoteNotificationsExampleTests
//
//  Created by Arnaud Coomans on 13/02/13.
//  Copyright (c) 2013 acoomans. All rights reserved.
//

#import "SimulatorRemoteNotificationsExampleTests.h"
#import "ACSimulatorRemoteNotificationsService.h"
#import "UIApplication+SimulatorRemoteNotifications.h"
#import "ACAppDelegate.h"


@implementation SimulatorRemoteNotificationsExampleTests

- (void)testExample {
    
    ACAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSDictionary *dictionary = @{@"message": @"message"};
    [[ACSimulatorRemoteNotificationsService sharedService] send:dictionary];
    
    NSDate *date = [NSDate date];
	while (YES) {
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
								 beforeDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if ([[NSDate date] timeIntervalSinceDate:date] > 1) {
			break;
		}
	}
    
    STAssertNotNil(appDelegate.didRegisterForRemoteNotificationsWithDeviceToken, nil);
    STAssertEqualObjects(dictionary, appDelegate.didReceiveRemoteNotificationUserInfo, nil);
}

@end