//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var placeListVM = PlaceListViewController()
    
    var body: some View {
        NavigationView{
            List {
                AddPlaceView { (success) in
                    if success {
                        self.placeListVM.fetchAllPlaces()
                    }
                }
                ForEach(placeListVM.places, id: \.id) {
                    item in
                    PlaceCell(placeVM: item)
                }.onDelete { (offsets) in
                    offsets.forEach { (index) in
                        let p = self.placeListVM.places[index]
                        self.placeListVM.deletePlace(id: p.id)
                    }
                }
                
                
            }.navigationBarTitle("Favorite Places")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
