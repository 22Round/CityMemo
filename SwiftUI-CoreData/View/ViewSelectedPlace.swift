//
//  ViewSelectedPlace.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/30/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct ViewSelectedPlace: View {
    var placeVM:PlaceViewModel
    var body: some View {
        NavigationView {
            VStack {
                MapView(addressString: "\(placeVM.name), \(placeVM.country)").frame(height:300)
            }
        }
    }
}
