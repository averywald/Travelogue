//
//  Post+CoreDataClass.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import UIKit
import CoreData

@objc(Post)
public class Post: NSManagedObject {
	
	// does post need a media array?
	var media: [Media]? {
		return self.postMedia?.array as? [Media]
	}
	
	var trip: Trip? {
		return self.postTrip
	}
	
	convenience init?(date d: Date, text t: String?) {
		// get app delegate
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		
		// get managed context
		guard let context = appDelegate?.persistentContainer.viewContext else {
			return nil
		}
		
		// insert into respective Trip's managed context
		self.init(entity: Trip.entity(), insertInto: context)
		
		// assign values
		self.date = d
		self.text = t
		
	}

}