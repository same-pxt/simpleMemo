//
//  MemoModel+CoreDataProperties.swift
//  memoApp
//
//  Created by ssyb on 2024/4/16.
//
//

import Foundation
import CoreData


extension MemoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoModel> {
        return NSFetchRequest<MemoModel>(entityName: "MemoModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var data: Date?

}

extension MemoModel : Identifiable {

}
