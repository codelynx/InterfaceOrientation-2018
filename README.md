# Landscape Only App on iPad

I was run into the situation to develop an app that only support `landscape` mode.  So here are the list of common to do list.

1. Check `Landscape Left`, `Landscape Right` to be checked on Target > General > Deployment Info
2. Override `var shouldAutorotate: Bool` to return `true` for `UIWindow`'s root view controller.
3. Override `var supportedInterfaceOrientations: UIInterfaceOrientationMask` to return `.landscape` for `UIWindow`'s root view controller.

<img width=300 src="https://qiita-image-store.s3.amazonaws.com/0/65634/1230881c-4ee5-0ba7-1cf7-86f1a3d60948.png" />

I cannot post the whole project on github. So, I extracted the key potions from the project. I made a two targets.


To make my life a bit easier, I provide such static function to my `AppDelegate`.

```.swift
class AppDelegate: UIResponder, UIApplicationDelegate {
	// ...
	static var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .landscape
	}
}
```

My view controller looks like this.


```.swift
class MyViewController: UIViewController {
	// ...
	override var shouldAutorotate: Bool {
		let value = true
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}

	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		let value = AppDelegate.supportedInterfaceOrientations
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}
}
```

I use subclass of `UINavigationController` to override some methods as follows.


```.swift
class MyNavigationController: UINavigationController {
	// ...
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		let value =  self.topViewController?.supportedInterfaceOrientations ?? AppDelegate.supportedInterfaceOrientations
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}

	override var shouldAutorotate: Bool {
		let value = topViewController?.shouldAutorotate ?? true
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}

```

Here is the belief description of the two targets.

| Target | Description |
|:-----|:------------|
|test1 | `MyViewController` is the root view controller |
|test2 | `MyNavigationController` is the root view controller |

Once you tested, you will find that it stays on `landscape` mode on iPhone, by it kept rotating between `landscape` and `portrait` mode on iPad.

I figured out even `supportedInterfaceOrientations` method didn't get called on iPad (on iPhone it is being called).  Hey, I set only landscape orientation is enabled on `info.plist` how could it happen.

I was thinking about post this project for someone to help, then while I am composing this README, I found the answer to nail it.  OK, I will not include that on this project yet.  If someone would like to try, clone this repository to try, and find the answer from the end of this document and try fix it. 


Have a good day.

---

* [SupportedInterfaceOrientations not called in iPad]
(https://stackoverflow.com/questions/35274428/supportedinterfaceorientations-not-called-in-ipad)

