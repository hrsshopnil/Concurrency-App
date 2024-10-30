//
//  ContentView.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var vm = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            
            List(vm.users) { user in
                NavigationLink {
                    UserPostView()
                }
                label: {
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text(user.email)
                    }
                }
            }
        }
        .alert("Application Error", isPresented: $vm.showError, actions: {
            Button("Ok") {}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
        })
        .onAppear {
            vm.fetchUsers()
        }
        
        .overlay {
            if vm.isloading {
                ProgressView()
            }
        }
    }
    
    
}

#Preview {
    UserListView()
}
