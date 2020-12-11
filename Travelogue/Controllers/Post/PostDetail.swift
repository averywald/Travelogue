//
//  PostDetail.swift
//  Travelogue
//
//  Created by Avery Wald on 12/11/20.
//

import UIKit

class PostDetail: UIViewController {
	
	@IBOutlet weak var postTitle: UILabel!
	@IBOutlet weak var postCaption: UILabel!
	@IBOutlet weak var postImageView: UIImageView!
	
	var post: Post?

    override func viewDidLoad() { super.viewDidLoad() }
    
	override func viewWillAppear(_ animated: Bool) {
		// check for media
		if (post!.hasMedia) {
			// render the sucker
			postImageView.image = UIImage(data: (post?.media?[0].data)!) // bad :(
		}
		
		// add post data to UI
		self.title = post?.name
		postCaption.text = post?.caption
		
		
	}

}
