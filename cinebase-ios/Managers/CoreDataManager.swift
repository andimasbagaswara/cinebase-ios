//
//  CoreDataManager.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: PersistenceController.shared.container.viewContext)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func fetchItem(id: Int) -> Item? {
        
        var items = [Item]()
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", NSDecimalNumber(integerLiteral: id))
        
        do {
            items = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return items.first
        
    }
    
    func getAllItems() -> [Item] {
        
        var items = [Item]()
        
        let itemRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            items = try self.moc.fetch(itemRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return items
        
    }
    
    func saveItem(id: Int, title: String, genre: String, rating: Double, backdropPath: String) {
        
        let item = Item(context: self.moc)
        item.id = NSDecimalNumber(integerLiteral: id)
        item.title = title
        item.backdropPath = backdropPath
        item.rating = rating
        item.genre = genre
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
    }
    
    func deleteItem(id: Int) {
        
        do {
            if let item = fetchItem(id: id) {
                self.moc.delete(item)
                try self.moc.save()
            }
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
    }
}
