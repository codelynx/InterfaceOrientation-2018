//
//  MyViewController.swift
//  test2
//
//  Created by Kaz Yoshikawa on 3/15/18.
//

import UIKit

class MyViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func cameraAction(_ sender: Any) {
		let picker = UIImagePickerController()
		picker.delegate = self
		picker.allowsEditing = true
		picker.sourceType = .photoLibrary
		picker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
		self.present(picker, animated: true, completion: nil)
	}

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


extension MyViewController: UIImagePickerControllerDelegate {

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

		picker.dismiss(animated: true, completion: nil)
		if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage {
			self.imageView.image = image
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}

}

extension MyViewController: UINavigationControllerDelegate {

	func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
		let value = AppDelegate.supportedInterfaceOrientations
		print("\(type(of: self)): \(#function), value=\(value)")
		return value
	}
	
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
