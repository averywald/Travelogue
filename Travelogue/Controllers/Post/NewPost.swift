//
//  NewPost.swift
//  Travelogue
//
//  Created by Avery Wald on 12/10/20.
//

import UIKit

class NewPost: UIViewController,
			   UIImagePickerControllerDelegate,
			   UINavigationControllerDelegate {

	// ui elements go here
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var caption: UITextView!
	@IBOutlet weak var imageView: UIImageView!
	
	let imagePicker = UIImagePickerController() // for adding images to post
	var trip: Trip? // trip for the new / current post
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// image picker config
		imagePicker.allowsEditing = true
		imagePicker.delegate = self
	}
	
	// MARK: - Methods
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		// get the photo from the picker controller
		guard let i = info[.editedImage] as? UIImage else {
			print("no image to be found")
			return
		}
		
		imageView.image = i // show the selected photo in the UI
		picker.dismiss(animated: true) // discard the imagePicker
		
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		do { picker.dismiss(animated: true) }
	}
	
	// create an error popup and show it
	private func showPopup(title t: String, message m: String) -> Void {
		// initialize alert controller
		let ac = UIAlertController(title: t, message: m, preferredStyle: .alert)
		// add an action to the alert
		ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		// present to the UI
		self.present(ac, animated: true)
	}
	
	// MARK: - IBActions
	
	@IBAction func openCamera(_ sender: Any) {
		// check for device camera availability
		guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
			// present popup alert
			self.showPopup(title: "No Camera", message: "No camera available!")
			return
		}
		
		imagePicker.sourceType = .camera // set the image source to camera
		present(imagePicker, animated: true) // show in UI
	}
	
	@IBAction func openPhotos(_ sender: Any) {
		// check for photo library availability
		guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
			// present popup alert
			self.showPopup(title: "Library Error", message: "Cannot open photos library!")
			return
		}
		
		imagePicker.sourceType = .photoLibrary // image source is photo library
		present(imagePicker, animated: true) // show in UI
	}
	
	@IBAction func save(_ sender: Any) {
		// get all the new category attribs
		let n = name.text
		let c = caption.text
		
		// get image data for BinaryData cast
		guard let i = imageView.image?.pngData() else {
			return // prolly fix this ?
		}
		
		// try to create a Trip object from them
		if let post = Post(name: n, caption: c),
		   let media = Media(data: i, metaData: nil, uri: nil) {
			
			post.addToPostMedia(media) // add media to the post context
			trip?.addToRawPosts(post) // add post to trip context
			
			do {
				// save the new trip attribs
				try post.managedObjectContext?.save()
				
				// redirect back to trip list
				self.navigationController?.popViewController(animated: true)
				
			} catch { print("could not save new post") }
		} else { print("could not create post") }
	}
	
}
