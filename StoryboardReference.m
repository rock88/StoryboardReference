//
//  StoryboardReference.m
//  StoryboardReference
//
//  Created by rock88 on 25/06/15.
//  Copyright (c) 2015 rock88. All rights reserved.
//

#import "StoryboardReference.h"
#import <objc/runtime.h>

@implementation StoryboardReference

+ (void)load
{
    SEL sel = @selector(initWithIdentifier:source:destination:);
    Method originMethod = class_getInstanceMethod([UIStoryboardSegue class], sel);
    id(*originImpl)(id, SEL, id, id, id) = (id(*)(id, SEL, id, id, id))method_getImplementation(originMethod);
    
    IMP impl = imp_implementationWithBlock(^id(id instance, id identifier, id source, id destination) {
        
        StoryboardReference* reference = destination;
        
        if ([reference isKindOfClass:[StoryboardReference class]] && reference.storyboardName.length > 0)
        {
            NSBundle* bundle = [NSBundle bundleForClass:self];
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:reference.storyboardName bundle:bundle];
            
            if (reference.referenceIdentifier.length > 0)
            {
                destination = [storyboard instantiateViewControllerWithIdentifier:reference.referenceIdentifier];
            }
            else
            {
                destination = [storyboard instantiateInitialViewController];
            }
        }
        
        return originImpl(instance, sel, identifier, source, destination);
    });
    method_setImplementation(originMethod, impl);
}

@end
