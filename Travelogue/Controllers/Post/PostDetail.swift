//
//  PostDetail.swift
//  Travelogue
//
//  Created by Avery Wald on 12/11/20.
//

import UIKit

class PostDetail: UIViewController {
	
	var post: Post?

    override func viewDidLoad() { super.viewDidLoad() }
    
	override func viewWillAppear(_ animated: Bool) {
		self.title = post?.name
	}

}
