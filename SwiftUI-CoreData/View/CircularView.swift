//
//  CircularView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/30/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct CircularView: View {
    
    var image:Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle()
            .stroke(Color.green, lineWidth: 2))
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
    }
}
