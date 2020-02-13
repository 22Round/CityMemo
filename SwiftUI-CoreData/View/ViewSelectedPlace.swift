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
    
    lazy var image:UIImage? = UIImage(data: placeVM.image)
    
    func getImage() -> UIImage? {
        var mutatableSelf = self
        return mutatableSelf.image
    }
    
    var body: some View {
        NavigationView {
            VStack {
                MapView(addressString: "\(placeVM.name), \(placeVM.country)")
                    .frame(height:400)
                    .edgesIgnoringSafeArea(.top)
                
                CircularView(image: Image(uiImage: getImage()!))
                    .frame(width: 300, height: 300)
                    .offset(y:-350).padding(.bottom, -350)
                
                HStack(alignment: .center) {
                    Text(placeVM.name).font(.title)
                    Spacer()
                    Divider()
                    Spacer()
                    Text(placeVM.country)
                }.padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                Text(placeVM.notes)
                    .lineLimit(100)
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
            }
        }.navigationBarTitle("\(placeVM.name)", displayMode: .inline)
    }
}
