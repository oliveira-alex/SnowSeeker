//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Alex Oliveira on 11/01/2022.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name = "Taylor Swift"
    var profession = "Singer"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingAlert = false
    @State private var alertTitle = "User Selected"
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                selectedUser = User()
                
                if let selectedUser = selectedUser {
                    alertTitle = selectedUser.name
                    isShowingAlert.toggle()
                }
                
            }
            .alert(alertTitle, isPresented: $isShowingAlert, presenting: selectedUser) { user in
                Button(role: .cancel, action: { }, label: { Text("OK" )})
            } message: { user in
                Text(user.profession)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
