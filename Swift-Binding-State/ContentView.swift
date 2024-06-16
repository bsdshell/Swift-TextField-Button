//
//  ContentView.swift
//  Swift-Binding-State
//
//  Created by aaa on 2024-06-16.
//

import SwiftUI

struct Fruit : Identifiable{
    var id = UUID()
    var color : Color
    var name : String
}

struct ContentView: View {
    @State private var fruit : [Fruit] = [ Fruit(color:Color.green, name: "Apple"),
                                         Fruit(color:Color.cyan, name:"Orange")]
    @State private var selectedName: String = ""
    @State private var selectedFruit: Fruit = Fruit(color : Color.red, name:"init fruit")
    
    var body: some View {
        VStack {
            List(fruit) { item in
                Text(item.name)
                    .onTapGesture {
                        selectedFruit = item
                    }
            }
            .frame(height: 200)
            
            ChildView(selectedFruit: $selectedFruit)
                .padding()
        }
    }
}

struct ChildView: View {
    @Binding var selectedFruit: Fruit
    
    var body: some View {
        TextField("Edit item", text: $selectedFruit.name)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(selectedFruit.color)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        Button("Print in console"){
            print("item => \(selectedFruit.name)")
            
        }
        .buttonStyle(.borderedProminent)

    }
}

#Preview {
    ContentView()
}
