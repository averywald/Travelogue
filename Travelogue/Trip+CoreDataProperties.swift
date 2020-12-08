//
//  Trip+CoreDataProperties.swift
//  Travelogue
//
//  Created by Avery Wald on 12/7/20.
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
    @NSManaged public var startDate: Date?
    @NSManaged public var posts: NSOrderedSet?

}

// MARK: Generated accessors for posts
extension Trip {

    @objc(insertObject:inPostsAtIndex:)
    @NSManaged public func insertIntoPosts(_ value: Post, at idx: Int)

    @objc(removeObjectFromPostsAtIndex:)
    @NSManaged public func removeFromPosts(at idx: Int)

    @objc(insertPosts:atIndexes:)
    @NSManaged public func insertIntoPosts(_ values: [Post], at indexes: NSIndexSet)

    @objc(removePostsAtIndexes:)
    @NSManaged public func removeFromPosts(at indexes: NSIndexSet)

    @objc(replaceObjectInPostsAtIndex:withObject:)
    @NSManaged public func replacePosts(at idx: Int, with value: Post)

    @objc(replacePostsAtIndexes:withPosts:)
    @NSManaged public func replacePosts(at indexes: NSIndexSet, with values: [Post])

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Post)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Post)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSOrderedSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSOrderedSet)

}

extension Trip : Identifiable {

}
