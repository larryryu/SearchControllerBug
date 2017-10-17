# SearchControllerBug
Leak caused by UISearchController on iOS10

Steps to reproduce

- Lauch app on iOS 10
- Tap "next view" button on the intial view.
- Tap to activate seach bar
- Tap back button (while keyboard is still up)

Note that [ViewController2 dealloc] is never called.

Below is the memory graph of the app after ViewController2 is dismissed.

![Alt text](https://github.com/larryryu/SearchControllerBug/blob/master/memory_graph.png)
