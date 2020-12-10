//
//  Trip+CoreDataClass.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import UIKit
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
	
	// posts array
	var posts: [Post]? {
		return self.rawPosts?.array as? [Post]
	}
	
	convenience init?(start s: Date?, end e: Date?, location l: String?) {
		// get app delegate
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		
		// get managed context
		guard let context = appDelegate?.persistentContainer.viewContext else {
			return nil
		}
		
		// insert into managed context
		self.init(entity: Trip.entity(), insertInto: context)
		
		// assign values
		self.startDate = s
		self.endDate = e
		self.location = l
		
	}

}
