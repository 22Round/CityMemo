//
//  AddPlaceViewModel.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 2/4/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation

class AddPlaceViewModel {
    var name:String = ""
    var country:String = ""
    var notes:String = ""
    
    func savePlace(saved: @escaping () -> Void) {
        let encodedName = self.name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        guard let name = encodedName,let url = URL(string: "https://source.unsplash.com/1600x900?\(name)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                try? CoreDataManager.shared.savePlace(name: self.name, country: self.country, notes: self.notes, imageData: data)
                saved()
            }
            
        }.resume()
    }
}

