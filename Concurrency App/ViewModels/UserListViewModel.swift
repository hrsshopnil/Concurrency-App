//
//  UserListViewModels.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//
import Foundation


class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isloading = false
    @Published var showError = false
    @Published var errorMessage: String?
    
    init() {
        Task {
            await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async {
        let apiService = ApiService(urlString: "https://jsonplaceholder.typicode.com/users")
        isloading.toggle()

        defer {
            isloading.toggle()
        }
        
        do {
            users = try await apiService.getJson()
        } catch {
            showError = true
            errorMessage = error.localizedDescription
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            apiService.getJson { (result: Result<[User], ApiError>) in
//                defer {
//                    DispatchQueue.main.async {
//                        self.isloading.toggle()
//                    }
//                }
//                switch result {
//                case .success(let users):
//                    DispatchQueue.main.async {
//                        self.users = users
//                    }
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        self.showError = true
//                        self.errorMessage = error.localizedDescription
//                    }
//
//                }
//            }
//        }
        
    }
}
