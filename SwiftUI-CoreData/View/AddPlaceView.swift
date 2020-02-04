//
//  AddPlaceView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/28/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import SwiftUI

struct AddPlaceView: View {
    
    @State var name:String = ""
    @State var country:String = ""
    @State var note:String = ""
    
    var onSave: (_ success:Bool) -> Void
    @State private var showingAlert = false
    
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
                    self.savePlace()
                }
                .alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(title: Text("Saved"), message: Text("Data saved to DB"), dismissButton:  .default(Text("OK")))
                }
                .disabled($name.wrappedValue.isEmpty)
            }
            .font(.headline)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(15)
        }.padding()
    }
    
    private func savePlace(){
        let vm = AddPlaceViewModel()
        vm.name = self.$name.wrappedValue
        vm.country = self.$country.wrappedValue
        vm.notes = self.$note.wrappedValue
        vm.savePlace {
            self.showingAlert = true
            self.onSave(true)
            self.$name.wrappedValue = ""
            self.$country.wrappedValue = ""
            self.$note.wrappedValue = ""
        }
    }
}
