//
//  SwiftUIView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation

class PlaceViewModel {
    var id:UUID
    var name:String
    var country:String
    var notes:String
    var image:Data
    
    init(id:UUID, name:String, country:String, notes:String, image:Data) {
        self.id = id
        self.name = name
        self.country = country
        self.notes = notes
        self.image = image
    }
}
