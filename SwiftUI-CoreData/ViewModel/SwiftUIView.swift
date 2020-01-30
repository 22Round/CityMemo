//
//  SwiftUIView.swift
//  SwiftUI-CoreData
//
//  Created by Savedroid on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation

class PlaceViewModel {
    var id:UUID
    var name:String
    var country:String
    var notes:String
    
    init(name:String, country:String, notes:String) {
        self.id = UUID()
        self.name = name
        self.country = country
        self.notes = notes
    }
}


class DummyData {
    static func mockPlaces() -> [PlaceViewModel] {
        return [PlaceViewModel(name: "Tbilisi", country: "Georgia", notes: "Capital city"),
                PlaceViewModel(name: "Frankfurt", country: "Germany", notes: "Financial center"),
                PlaceViewModel(name: "Newyourk", country: "USA", notes: "Megapolise")
        ]
    }
}
