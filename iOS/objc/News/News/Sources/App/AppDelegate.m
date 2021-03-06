/**
 * Copyright (c) 2016 Ivan Magda
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "AppDelegate.h"
#import "NewsApiClient.h"
#import "CannedDataDirectorDataSource.h"
#import "SourcesTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    NewsApiClient *_newsApiClient;
    DataDirector *_dataDirector;
}

#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setup];

    return YES;
}

#pragma mark Private

- (void)setup {
    _newsApiClient = [NewsApiClient sharedInstance];
    CannedDataDirectorDataSource *dataSourceDirector = [[CannedDataDirectorDataSource alloc] initWithApiClient:_newsApiClient];
    _dataDirector = [[DataDirector alloc] initWithDataSource:dataSourceDirector];

    UINavigationController *navigationVC = (UINavigationController *) [_window rootViewController];
    SourcesTableViewController *sourcesVC = navigationVC.viewControllers[0];
    sourcesVC.dataDirector = _dataDirector;
}

@end
