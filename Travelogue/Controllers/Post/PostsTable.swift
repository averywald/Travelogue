//
//  PostsTable.swift
//  Travelogue
//
//  Created by Avery Wald on 12/11/20.
//

import UIKit
import CoreData

class PostsTable: UITableViewController {
	
	@IBOutlet var postsTable: UITableView!
	
	var trip: Trip? // chosen trip from previous scene
	var posts: [Post]? = [] // posts for chosen trip
	
	override func viewDidLoad() { super.viewDidLoad() }
	
	override func viewWillAppear(_ animated: Bool) {
		posts = (trip?.posts)! as [Post] // retrieve posts for chosen trip
		self.title = trip?.name // set title with trip name
		self.postsTable.reloadData() // load data into UI
	}
	
	// MARK: - Methods
	
	func deletePost(indexPath: IndexPath) {
		let post = posts?[indexPath.row] // get the post to be deleted
		
		// get the core data context
		guard let context = post?.managedObjectContext else { return }
		
		context.delete(post!) // delete the post item from core data context
		
		do {
			try context.save() // save the newly updated core data context
			posts?.remove(at: indexPath.row) // remove the row from the class
			postsTable.deleteRows(at: [indexPath], with: .fade) // update UI
		} catch {
			print("could not delete post")
		}
		
		postsTable.reloadData() // update the UI data to reflect core data
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// creating a new post
		if (segue.identifier == "newPost") {
			// set the destination scene view controller
			guard let dest = segue.destination as? NewPost else { return }
			// pass values to the editor scene
			dest.trip = trip
		}
		// viewing an existing post
		if (segue.identifier == "postDetail") {
			// get destination view controller
			guard let dest = segue.destination as? PostDetail else { return }
			// get the indexPath for the selected Post object
			guard let sel = self.postsTable.indexPathForSelectedRow?.row else {
				return
			}
			
			// pass post data to detail view controller
			dest.post = posts?[sel]
		}
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts?.count ?? 0
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
		
		// set UI elements
		cell.textLabel?.text = posts?[indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletePost(indexPath: indexPath) // delete post with left swipe
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {}

}
