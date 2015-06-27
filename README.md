###Storyboard Reference

iOS 9 introduced 'Storyboard References', this feature allow place various user navigation cases in other storyboard and easily link them.
Great tool, but it not work for previous iOS versions.

###Idea
What if swizzle

    -initWithIdentifier:source:destination:
method in UIStoryboardSegue class, check destinationViewController and if is kind of StoryboardReference class - create new viewController from storyboardName/referenceIdentifier property and return it as destination?


###Installation
[See Installation Guide](https://github.com/rock88/StoryboardReference/wiki/Installation-Guide).

###Setup/Use
[See Setup Guide](https://github.com/rock88/StoryboardReference/wiki/Setup-Guide)

###Limitations:
StoryboardReference currently can't use with:
* UINavigationController as rootViewController;
* UITabBarController as viewControllers;
* UISplitViewController as master/detailViewController;
* Perhaps in some other cases, if you find bug, please create issue.
