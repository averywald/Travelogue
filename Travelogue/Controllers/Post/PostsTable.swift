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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
