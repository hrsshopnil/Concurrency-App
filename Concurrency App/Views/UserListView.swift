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
        NavigationView {
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
            
            .overlay {
                if vm.isloading {
                    ProgressView()
                }
            }
            .onAppear {
                vm.fetchUsers()
            }
        }
    }
}

#Preview {
    UserListView()
}
