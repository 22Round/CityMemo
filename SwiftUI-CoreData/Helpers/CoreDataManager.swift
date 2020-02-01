//
//  CoreDataManager.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 2/1/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(context: NSManagedObjectContext.current)
    var context:NSManagedObjectContext?
    
    private init(context:NSManagedObjectContext?) {
        self.context = context
    }
    
    func getPlaces() throws ->[Place]{
        guard let context = context else {throw CoreDataPlaceError.contextError}
        
        var place = [Place]()
        let placeRequest:NSFetchRequest<Place> = Place.fetchRequest()
        
        do {
            place = try context.fetch(placeRequest)
        } catch {
            throw CoreDataPlaceError.fetchError
        }
        return place
    }
    
    func savePlace(name:String, country:String, notes:String, imageData:Data) throws {
        guard let context = self.context else {throw CoreDataPlaceError.contextError}
        
        let place = Place(context: context)
        place.id = UUID()
        place.name = name
        place.country = country
        place.notes = notes
        place.image = imageData
        
        do {
            try context.save()
        }catch {
            throw CoreDataPlaceError.saveError
        }
    }
    
    func deletePlace(id:UUID) throws {
        guard let context = self.context else {throw CoreDataPlaceError.contextError}
        
        let fetchRequest: NSFetchRequest<Place> = Place.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let fetchedPlaces = try context.fetch(fetchRequest)
            for pl in fetchedPlaces {
                context.delete(pl)
            }
            try context.save()
        }catch {
            throw CoreDataPlaceError.deleteError
        }
    }
}


enum CoreDataPlaceError: Error {
    case contextError
    case fetchError
    case saveError
    case deleteError
}
