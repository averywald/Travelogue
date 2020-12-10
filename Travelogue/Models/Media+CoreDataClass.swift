//
//  Media+CoreDataClass.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import UIKit
import CoreData

@objc(Media)
public class Media: NSManagedObject {
	
	convenience init?(data d: Data?, metaData md: String?, uri u: URL?) {
		// get app delegate
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		
		// get managed context
		guard let context = appDelegate?.persistentContainer.viewContext else {
			return nil
		}
		
		// insert into its respective Post's managed context
		self.init(entity: Post.entity(), insertInto: context)
		
		// assign values
		self.data = d
		self.metaData = md
		self.uri = u
		
	}

}
