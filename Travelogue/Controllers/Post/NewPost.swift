//
//  NewPost.swift
//  Travelogue
//
//  Created by Avery Wald on 12/10/20.
//

import UIKit

class NewPost: UIViewController {

	// ui elements go here
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var caption: UITextView!
	
	var trip: Trip? // trip for the new / current post
	
	override func viewDidLoad() { super.viewDidLoad() }
	
	@IBAction func save(_ sender: Any) {
		// get all the new category attribs
		let n = name.text
		let c = caption.text
		
		// try to create a Trip object from them
		if let post = Post(name: n, caption: c) {
			
			// add post to trip context
			trip?.addToRawPosts(post)
			
			do {
				// save the new trip attribs
				try post.managedObjectContext?.save()
				
				// redirect back to trip list
				self.navigationController?.popViewController(animated: true)
				
			} catch { print("could not save new post") }
		} else { print("could not create post") }
	}
	
}
