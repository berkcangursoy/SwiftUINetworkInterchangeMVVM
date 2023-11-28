//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Berkcan Gürsoy on 25.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        //self.userListViewModel = UserListViewModel()
        self.userListViewModel = UserListViewModel(service: Localservice()) // Localservice()
    }
    
    var body: some View {
        List(userListViewModel.userList,id: \.id) { user in
            VStack {
                Text(user.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.donwloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
