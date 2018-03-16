//
//  MyNavigationController.swift
//  test2
//
//  Created by Kaz Yoshikawa on 3/15/18.
//

import UIKit

class MyNavigationController: UINavigationController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	// MARK: -

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

	override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
		let value = topViewController?.preferredInterfaceOrientationForPresentation ?? AppDelegate.preferredInterfaceOrientationForPresentation
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}

}
