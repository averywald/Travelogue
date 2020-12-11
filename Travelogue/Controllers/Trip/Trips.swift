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

    override func viewDidLoad() { super.viewDidLoad() }
	
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
		} catch { print("could not fetch trips") }
	}
	
	// MARK: - Methods
	
	func deleteTrip(indexPath: IndexPath) {
		let trip = trips[indexPath.row] // get the trip to be deleted
		
		// get the core data context
		guard let context = trip.managedObjectContext else { return }
		
		context.delete(trip) // delete the trip item from core data context
		
		do {
			try context.save() // save the newly updated core data context
			trips.remove(at: indexPath.row) // remove the row from the class
			tripTableView.deleteRows(at: [indexPath], with: .fade) // update UI
		} catch { print("could not delete document") }
		
		tripTableView.reloadData() // update the UI data to reflect core data
	}
	
	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// get the destination scene, cast as Posts controller
		guard let dest = segue.destination as? PostsTable else { return }
		// get the indexPath for the selected trip item
		guard let sel = self.tripTableView.indexPathForSelectedRow?.row else {
			return
		}
		
		dest.trip = trips[sel] // pass trip data to the post view controller
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			self.deleteTrip(indexPath: indexPath) // delete the row from the data source
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {}

}
