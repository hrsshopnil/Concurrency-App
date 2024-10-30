//
//  UserPostView.swift
//  Concurrency App
//
//  Created by shopnil hasan on 30/10/24.
//

import Foundation

class UserPostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
        let apiService = ApiService(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            apiService.getJson { (result: Result<[Post], ApiError>) in
                defer {
                    DispatchQueue.main.async {
                        self.isLoading.toggle()
                    }
                }
                switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}
