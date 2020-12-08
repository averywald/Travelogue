//
//  Trip+CoreDataClass.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import Foundation
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
	
	convenience init(start s: Date?, end e: Date?, location l: string?) {
		// get app delegate
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		
		// get managed context
		guard let context = appDelegate?.persistentContainer.viewContext else {
			return nil
		}
		
		// insert into managed context
		self.init(entity: Category.entity(), insertInto: context)
		
		// assign property values
//		self.title = title
	}

}
