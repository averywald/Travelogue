//
//  Post+CoreDataClass.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject {
	
	convenience init(<#parameters#>) {
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
