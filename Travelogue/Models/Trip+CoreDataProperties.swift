//
//  Trip+CoreDataProperties.swift
//  Travelogue
//
//  Created by Avery Wald on 12/10/20.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var rawPosts: NSOrderedSet?

}

// MARK: Generated accessors for rawPosts
extension Trip {

    @objc(insertObject:inRawPostsAtIndex:)
    @NSManaged public func insertIntoRawPosts(_ value: Post, at idx: Int)

    @objc(removeObjectFromRawPostsAtIndex:)
    @NSManaged public func removeFromRawPosts(at idx: Int)

    @objc(insertRawPosts:atIndexes:)
    @NSManaged public func insertIntoRawPosts(_ values: [Post], at indexes: NSIndexSet)

    @objc(removeRawPostsAtIndexes:)
    @NSManaged public func removeFromRawPosts(at indexes: NSIndexSet)

    @objc(replaceObjectInRawPostsAtIndex:withObject:)
    @NSManaged public func replaceRawPosts(at idx: Int, with value: Post)

    @objc(replaceRawPostsAtIndexes:withRawPosts:)
    @NSManaged public func replaceRawPosts(at indexes: NSIndexSet, with values: [Post])

    @objc(addRawPostsObject:)
    @NSManaged public func addToRawPosts(_ value: Post)

    @objc(removeRawPostsObject:)
    @NSManaged public func removeFromRawPosts(_ value: Post)

    @objc(addRawPosts:)
    @NSManaged public func addToRawPosts(_ values: NSOrderedSet)

    @objc(removeRawPosts:)
    @NSManaged public func removeFromRawPosts(_ values: NSOrderedSet)

}

extension Trip : Identifiable {

}
