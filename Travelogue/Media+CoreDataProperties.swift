//
//  Media+CoreDataProperties.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import Foundation
import CoreData


extension Media {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media> {
        return NSFetchRequest<Media>(entityName: "Media")
    }

    @NSManaged public var data: Data?
    @NSManaged public var metadata: String?
    @NSManaged public var uri: URL?
    @NSManaged public var post: Post?

}

extension Media : Identifiable {

}
