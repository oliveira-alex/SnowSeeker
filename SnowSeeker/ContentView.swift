//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Alex Oliveira on 11/01/2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                selectedUser = User()
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
