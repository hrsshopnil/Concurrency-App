//
//  UserPostView.swift
//  Concurrency App
//
//  Created by shopnil hasan on 30/10/24.
//

import SwiftUI

struct UserPostView: View {
    @StateObject private var viewModel = UserPostViewModel()
    var body: some View {
        List(viewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                //Text(post.)
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    UserPostView()
}
