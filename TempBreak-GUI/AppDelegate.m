/**
 * sn0wflake - Get a lot of technical device information.
 * Copyright (C) 2014  Louis Kremer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 **/

#import "AppDelegate.h"
#import "MobileDevice_mod.h"

static AppDelegate *load;
struct am_device* device;
struct am_device_notification *notification;

void notification_callback(struct am_device_notification_callback_info *info, int cookie) {
	if (info->msg == ADNCI_MSG_CONNECTED) {
		device = info->dev;
		AMDeviceConnect(device);
		AMDevicePair(device);
		AMDeviceValidatePairing(device);
		AMDeviceStartSession(device);
		[load check];
	} else if (info->msg == ADNCI_MSG_DISCONNECTED) {
		[load disconnected];
	} else {
	}
}

@implementation AppDelegate

@synthesize window, loadingInd, deviceDetails, device2details, jb, progressbar, ex, loading, onecell, twocell, status, mored2, version, version2, version3, version4, getudid;

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (IBAction)exit:(id)sender {
    [[NSApplication sharedApplication] terminate:nil];
}

- (NSString *)DeviceValue:(NSString *)value {
	return (__bridge NSString *)(AMDeviceCopyValue(device, 0, (__bridge CFStringRef)(value)));
}

- (void)deviceCallback {
    [onecell setHidden: YES];
    [twocell setHidden: YES];
    [loading setHidden: YES];
	[loadingInd setHidden:YES];
}

- (IBAction)twitter:(id)sender {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://twitter.com/cal0x"]];
}

- (void)disconnected {
    [onecell setHidden: YES];
    [twocell setHidden: YES];
    [loading setHidden: YES];
    [loading setHidden: NO];
    [loading startAnimation: self];
    jb.enabled = NO;
	[deviceDetails setStringValue:@"Device disconnected"];
    getudid.stringValue = @"";
    [device2details setStringValue:@"Device Name:"];
    [mored2 setStringValue:@"Model Number:"];
    [version setStringValue:@"Serial Numer:"];
    [version4 setStringValue:@"Baseband Version:"];
    [mored2 setStringValue:@"Model Number:"];
    [version3 setStringValue:@"Hardware Model:"];
    [version2 setStringValue:@"Build Version:"];
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    getudid.stringValue = @"";
    [device2details setStringValue:@"Device Name:"];
    [mored2 setStringValue:@"Model Number:"];
    [version setStringValue:@"Serial Numer:"];
    [version4 setStringValue:@"Baseband Version:"];
    [mored2 setStringValue:@"Model Number:"];
    [version3 setStringValue:@"Hardware Model:"];
    [version2 setStringValue:@"Build Version:"];
    [onecell setHidden: YES]; [twocell setHidden: YES]; [ex setHidden:YES];
    [loading setHidden: YES]; [loadingInd setHidden: NO]; [loadingInd startAnimation: self];
    jb.enabled = NO; load = self;
    AMDeviceNotificationSubscribe(notification_callback, 0, 0, 0, &notification);
}

- (IBAction)fi:(id)sender {
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://cal0x.com"]];
}

- (void)check {
	NSString *devicetype = [self DeviceValue:@"ProductType"]; // Used
	NSString *firmwareVersion = [self DeviceValue:@"ProductVersion"]; // Used
	NSString *support;
    NSString *unknow = @"Unknown";
    [onecell setHidden: YES];
    [twocell setHidden: YES];
    [loading setHidden: YES];
    [loadingInd setHidden: NO];
    [loadingInd startAnimation: self];
    [loading setHidden: YES];
    [loadingInd setHidden:YES];
    NSString *complete = [NSString stringWithFormat:@"%@ %@ %@ %@", devicetype, @"on iOS", firmwareVersion, @"is connected"];
    NSString *complete2 = [NSString stringWithFormat:@"Device Name: %@ ", [self DeviceValue:@"DeviceName"]];
    NSString *complete3 = [NSString stringWithFormat:@"Model Number: %@", [self DeviceValue:@"ModelNumber"]];
    NSString *version1 = [NSString stringWithFormat:@"Serial Number: %@", [self DeviceValue:@"SerialNumber"]];
    NSString *versionzwei = [NSString stringWithFormat:@"Build Version: %@", [self DeviceValue:@"BuildVersion"]];
    NSString *versiondrei = [NSString stringWithFormat:@"Hardware Model: %@", [self DeviceValue:@"HardwareModel"]];
    NSString *versionvier = [NSString stringWithFormat:@"Baseband Version: %@", [self DeviceValue:@"BasebandVersion"]];
    [mored2 setStringValue:complete3];
    [deviceDetails setStringValue:complete];
    [device2details setStringValue:complete2];
    [version setStringValue:version1];
    [version2 setStringValue:versionzwei];
    [version3 setStringValue:versiondrei];
    [version4 setStringValue:versionvier];
    CFStringEncoding encoding = CFStringGetSystemEncoding();
	char *udid = CFStringGetCStringPtr(AMDeviceCopyDeviceIdentifier(device), encoding);
    NSString* string = [NSString stringWithFormat:@"%s" , udid];
    getudid.stringValue = string;
}

- (void)done {
    NSRunAlertPanel(@"TempBreak", @"Thanks for using TempBreak", @"Sure!", NULL, NULL);
    [status setStringValue:@"D o n e !  Your iDevice was successfully jailbroken."];
    [onecell setHidden: YES];
    [twocell setHidden: YES];
    [progressbar stopAnimation: self];
    [jb setHidden:YES];
    [ex setHidden:NO];
}

- (IBAction)jailbreak:(id)sender {
    [jb setTitle:@"Jailbreaking ..."];
    [progressbar setIndeterminate:YES];
    [progressbar setHidden: NO];
    [progressbar startAnimation: self];
    [onecell setHidden: YES];
    [twocell setHidden: YES];
    sleep(3);
	[load done];
}
@end
