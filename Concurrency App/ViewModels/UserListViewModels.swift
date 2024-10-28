//
//  UserListViewModels.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//
import Foundation

class UserListViewModels: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        let apiService = ApiService(urlString: "https://jsonplaceholder.typicode.com/users")
        
        apiService.getJson { (result: Result<[User], ApiError>) in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

//extension UserListViewModels {
//    convenience init(forPreview: Bool = false) {
//        self.init()
//        if forPreview {
//            self.users = User.mo
//        }
//    }
//}
