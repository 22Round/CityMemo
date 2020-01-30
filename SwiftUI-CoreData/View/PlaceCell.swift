//
//  PlaceCell.swift
//  SwiftUI-CoreData
//
//  Created by Savedroid on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct PlaceCell: View {
    
    var placeVM:PlaceViewModel
    var body: some View {
        
        NavigationLink(destination: Text(placeVM.name)){
            HStack{
                Image("Building")
                    .resizable()
                    .frame(width: 66, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text(placeVM.name).font(.headline)
                    Text(placeVM.country).font(.headline)
                    Text(placeVM.notes).font(.headline)
                }
            }
        }
    }
}

struct PlaceCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaceCell(placeVM: PlaceViewModel(name: "Tbilisi", country: "Georgia", notes: "Bla"))
    }
}
