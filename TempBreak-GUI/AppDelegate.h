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

#import <Cocoa/Cocoa.h>
#import "MobileDevice_mod.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    __weak NSTextField *_deviceDetails;
    __weak NSProgressIndicator *_loadingInd;
    __unsafe_unretained NSWindow *_window;
}
@property (weak) IBOutlet NSTextField *getudid;
- (IBAction)exit:(id)sender;
@property (weak) IBOutlet NSButton *ex;
@property (weak) IBOutlet NSBox *twocell;
@property (weak) IBOutlet NSTextField *status;
@property (weak) IBOutlet NSTextField *mored2;
@property (weak) IBOutlet NSBox *onecell;
- (IBAction)fi:(id)sender;
@property (weak) IBOutlet NSTextField *version;
@property (weak) IBOutlet NSTextField *version4;
- (void)check;
@property (weak) IBOutlet NSTextField *version3;
- (void)disconnected;
- (void)deviceCallback;
- (IBAction)twitter:(id)sender;
@property (weak) IBOutlet NSTextField *version2;
- (void)loadingProgress;
- (void)start;
- (NSString *)DeviceValue:(NSString *)value;
@property (weak) IBOutlet NSProgressIndicator *loading;
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSProgressIndicator *progressbar1;
@property (weak) IBOutlet NSTextField *device2details;
- (IBAction)jailbreak:(id)sender;
@property (weak) IBOutlet NSButton *jb;
@property (weak) IBOutlet NSProgressIndicator *progressbar;
@property (weak) IBOutlet NSProgressIndicator *loadingInd;
@property (weak) IBOutlet NSTextField *deviceDetails;
@end
