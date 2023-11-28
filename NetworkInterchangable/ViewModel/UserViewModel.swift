//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Berkcan Gürsoy on 25.11.2023.
//

import Foundation


class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    private var service : NetworkService
    init(service : NetworkService) {
        self.service = service
    }
    
    func donwloadUsers () async {
        
        var resource = "" // networkservice için
        
        if service.type == "Webservice" { // networkservice için
            resource = Constants.Urls.userExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        do {                        //webservice.download(Constants.Urls.userExtension)
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init) // userları userviewmodel'a çeviriyoruz.
            }
            
        } catch {
            
        }
    }
}


struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
}
