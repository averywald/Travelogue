//
//  NewTrip.swift
//  Travelogue
//
//  Created by Avery Wald on 12/9/20.
//

import UIKit

class NewTrip: UIViewController {
	
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var startLoc: UITextField!
	@IBOutlet weak var startDate: UIDatePicker!
	@IBOutlet weak var endLoc: UITextField!
	@IBOutlet weak var endDate: UIDatePicker!
	
	var mode: String = "new" // hack way to track status
	var existingTrip: Trip?
	let mc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
	
	override func viewDidLoad() { super.viewDidLoad() }
	
	override func viewWillAppear(_ animated: Bool) {
		// if editing a trip object
		if (existingTrip != nil) {
			self.title = "Edit Trip" // set page title
			self.mode = "edit" // change to edit mode
			
			// assign its values to the UI elements
			name.text = existingTrip?.name
			startLoc.text = existingTrip?.location
			// need end loc in model ??
			startDate.date = (existingTrip?.startDate)!
			endDate.date = (existingTrip?.endDate)!
		}
	}
    
	@IBAction func save(_ sender: Any) {
		// get all the new category attribs
		let n = name.text
		let s = startLoc.text
		let d = startDate.date
		let e = endDate.date
		
		// try to create a Trip object from them
		if let trip = Trip(name: n, start: d, end: e, location: s) {
			if (mode == "edit") {
				do { try mc?.save() }
				catch { print("could not update trip") }
			} else {
				do { try trip.managedObjectContext?.save() }
				catch { print("could not save new trip") }
			}
			// redirect back to trip list
			self.navigationController?.popViewController(animated: true)
		}
	}

}
