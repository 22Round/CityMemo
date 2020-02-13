//
//  PlaceCell.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct PlaceCell: View {
    
    let placeVM:PlaceViewModel
    lazy var image:UIImage? = UIImage(data: placeVM.image)
    
    func getImage() -> UIImage? {
        var mutatableSelf = self
        return mutatableSelf.image
    }
    
    var body: some View {
        
        NavigationLink(destination: ViewSelectedPlace(placeVM: placeVM)){
            HStack{
                if getImage() != nil {
                    Image(uiImage: getImage()!)
                        .resizable()
                        .frame(width: 66, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }
                
                
                VStack(alignment: .leading){
                    Text(placeVM.name).font(.headline)
                    Text(placeVM.country).font(.headline)
                    Text(placeVM.notes).font(.headline)
                }
            }
        }
    }
}
