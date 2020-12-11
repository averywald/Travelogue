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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
