//
//  DZViewControllerLogLifeCircleAction.m
//  Pods
//
//  Created by baidu on 2016/11/17.
//
//

#import "DZViewControllerLogLifeCircleAction.h"
#import <objc/runtime.h>
#import "TalkingData.h"
#import "DZProgrameDefines.h"

NSString* YHTrackViewControllerPageName(UIViewController* vc) {
    NSString* pageName = [NSString stringWithFormat:@"ios.%@",vc.class];
    return pageName;
}


@implementation DZViewControllerLogLifeCircleAction

+ (void) load
{
    DZVCRegisterGlobalAction([DZViewControllerLogLifeCircleAction new]);
}
- (void) hostController:(UIViewController *)vc viewDidDisappear:(BOOL)animated
{
    [super hostController:vc viewDidDisappear:animated];
    [TalkingData trackPageBegin:YHTrackViewControllerPageName(vc)];
    
}

- (void) hostController:(UIViewController *)vc viewDidAppear:(BOOL)animated
{
    [super hostController:vc viewDidAppear:animated];
    [TalkingData trackPageEnd:YHTrackViewControllerPageName(vc)];
}

@end
