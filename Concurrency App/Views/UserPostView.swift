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
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.headline)
                Text("Post ID: \(post.id)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .background(
            LinearGradient(colors: [.blue.opacity(0.2), .purple.opacity(0.2)], 
                          startPoint: .topLeading,
                          endPoint: .bottomTrailing)
        )

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
