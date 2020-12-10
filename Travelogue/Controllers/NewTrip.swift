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
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func save(_ sender: Any) {
		// get all the new category attribs
		let n = name.text
		let s = startLoc.text
//		let e = endLoc.text
		
		// try to create a Trip object from them
		if let trip = Trip(name: n, start: startDate.date, end: endDate.date, location: s) {
			do {
				// save the new trip attribs
				try trip.managedObjectContext?.save()
				
				// redirect back to trip list
				self.navigationController?.popViewController(animated: true)
				
			} catch {
				print("could not save new trip")
			}
		}

	}

}
