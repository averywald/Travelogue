//
//  Posts.swift
//  Travelogue
//
//  Created by Avery Wald on 12/10/20.
//

import UIKit
import CoreData

class Posts: UICollectionViewController {

	@IBOutlet var postCollection: UICollectionView!
	
	var trip: Trip? // chosen trip from previous scene
	var posts: [Post] = [] // posts for chosen trip
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "postCell")
    }
	
	override func viewWillAppear(_ animated: Bool) {
		// get app delegate
		guard let ad = UIApplication.shared.delegate as? AppDelegate else {
			return
		}
		
		// get managed context
		let mc = ad.persistentContainer.viewContext
		
		// get Post objects from core data persistence
		let fReq: NSFetchRequest<Post> = Post.fetchRequest()
		
		do {
			// get the data from persistence layer
			posts = try mc.fetch(fReq)
			
			// refresh table with new data
			postCollection.reloadData()
			
			// if no posts to show
			if (posts.count == 0) {
				// redirect to new post page
			}
		} catch {
			print("could not fetch posts")
		}
	}


    // MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// get the index path for the selected post's UI cell
//		guard let indexPath = (sender as? UIView)?.findCollectionViewIndexPath() else { return }
		// set the destination scene
		guard let dest = segue.destination as? NewPost else { return }

		// pass values to the editor scene
		dest.trip = trip
//		dest.existingPost = trip?.posts?[indexPath.row] ?? nil
	}

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return trip?.posts?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath)
    
		// let content = cell.contentView
		
		// content
    
        return cell
    }

}

// make UICollectionView less of a pain
// thanks, Jeffery Thomas
	// https://stackoverflow.com/users/1298400/jeffery-thomas
extension UIView {

	func findCollectionView() -> UICollectionView? {
		if let collectionView = self as? UICollectionView {
			return collectionView
		} else {
			return superview?.findCollectionView()
		}
	}

	func findCollectionViewCell() -> UICollectionViewCell? {
		if let cell = self as? UICollectionViewCell {
			return cell
		} else {
			return superview?.findCollectionViewCell()
		}
	}

	func findCollectionViewIndexPath() -> IndexPath? {
		guard let cell = findCollectionViewCell(), let collectionView = cell.findCollectionView() else { return nil }

		return collectionView.indexPath(for: cell)
	}

}
