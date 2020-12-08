//
//  Post+CoreDataProperties.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var date: Date?
    @NSManaged public var media: Data?
    @NSManaged public var text: String?
    @NSManaged public var postMedia: NSOrderedSet?
    @NSManaged public var postTrip: Trip?

}

// MARK: Generated accessors for postMedia
extension Post {

    @objc(insertObject:inPostMediaAtIndex:)
    @NSManaged public func insertIntoPostMedia(_ value: Media, at idx: Int)

    @objc(removeObjectFromPostMediaAtIndex:)
    @NSManaged public func removeFromPostMedia(at idx: Int)

    @objc(insertPostMedia:atIndexes:)
    @NSManaged public func insertIntoPostMedia(_ values: [Media], at indexes: NSIndexSet)

    @objc(removePostMediaAtIndexes:)
    @NSManaged public func removeFromPostMedia(at indexes: NSIndexSet)

    @objc(replaceObjectInPostMediaAtIndex:withObject:)
    @NSManaged public func replacePostMedia(at idx: Int, with value: Media)

    @objc(replacePostMediaAtIndexes:withPostMedia:)
    @NSManaged public func replacePostMedia(at indexes: NSIndexSet, with values: [Media])

    @objc(addPostMediaObject:)
    @NSManaged public func addToPostMedia(_ value: Media)

    @objc(removePostMediaObject:)
    @NSManaged public func removeFromPostMedia(_ value: Media)

    @objc(addPostMedia:)
    @NSManaged public func addToPostMedia(_ values: NSOrderedSet)

    @objc(removePostMedia:)
    @NSManaged public func removeFromPostMedia(_ values: NSOrderedSet)

}

extension Post : Identifiable {

}
