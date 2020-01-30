//
//  AddPlaceView.swift
//  SwiftUI-CoreData
//
//  Created by Savedroid on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct AddPlaceView: View {
    
    @State var name:String = ""
    @State var country:String = ""
    @State var note:String = ""
    
    var body: some View {
        VStack {
            TextField("Enter name here...", text: $name)
            Divider()
            TextField("Enter name country...", text: $country)
            Divider()
            TextField("Enter name note...", text: $note)
            Divider()
            HStack{
                
                Button("Save favorite Place") {
                    print("button Action")
                }
            }
            .font(.headline)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(15)
        }.padding()
    }
}

struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView()
    }
}
