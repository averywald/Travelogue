//
//  Trips.swift
//  Travelogue
//
//  Created by Avery Wald on 12/9/20.
//

import UIKit
import CoreData

class Trips: UITableViewController {
	
	@IBOutlet var tripTableView: UITableView!
	var trips: [Trip] = []

    override func viewDidLoad() {
        super.viewDidLoad()

//         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
	
	override func viewWillAppear(_ animated: Bool) {
		// get app delegate
		guard let ad = UIApplication.shared.delegate as? AppDelegate else {
			return
		}
		
		// get managed context
		let mc = ad.persistentContainer.viewContext
		
		// get Category objects from core data persistence
		let fReq: NSFetchRequest<Trip> = Trip.fetchRequest()
		
		do {
			// get the data from persistence layer
			trips = try mc.fetch(fReq)
			
			// refresh table with new data
			tripTableView.reloadData()
		} catch {
			print("could not fetch categories")
		}
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return trips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
		
		// get title
		cell.textLabel?.text = trips[indexPath.row].name
		
		// get metadata

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
