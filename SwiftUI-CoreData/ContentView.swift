//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                AddPlaceView { (success) in
                    if success {
                        
                    }
                }
                ForEach(DummyData.mockPlaces(), id: \.id) {
                    item in
                    PlaceCell(placeVM: item)
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
