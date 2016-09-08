# SearchControllerBug
Leak caused by UISearchController on iOS10

Steps to reproduce

- Lauch app on iOS 10
- Tap "next view" button on the intial view.
- Tap to activate seach bar
- Tap back button

Note that [ViewController2 dealloc] is never called.
