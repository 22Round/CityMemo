//
//  PlaceListViewController.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 2/12/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class PlaceListViewController: ObservableObject {
    @Published var places = [PlaceViewModel]()
    
    init() {
        fetchAllPlaces()
    }
    
    func fetchAllPlaces() {
        do {
            self.places = try CoreDataManager.shared.getPlaces().map({ (place) -> PlaceViewModel in
                guard let id = place.id,
                    let name = place.name,
                    let country = place.country,
                    let note = place.notes,
                    let image = place.image else {return PlaceViewModel(id:UUID() ,name: "", country: "", notes: "", image: Data())}
                return PlaceViewModel(id:id, name: name, country: country, notes: note, image:image)
            })
        } catch {
            
        }
    }
    
    func deletePlace(id:UUID) {
        do {
            try CoreDataManager.shared.deletePlace(id: id)
            self.places.removeAll { (pvm) -> Bool in
                return pvm.id == id
            }
        }catch {
            
        }
    }
}
