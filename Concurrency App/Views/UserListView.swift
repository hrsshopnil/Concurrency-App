//
//  ContentView.swift
//  Concurrency App
//
//  Created by shopnil hasan on 28/10/24.
//

import SwiftUI

struct UserListView: View {
    
#warning("Remove the forPreview augument or set it false before shipping")
    
    @StateObject private var vm = UserListViewModels()
    var body: some View {
        NavigationView {
            List(vm.users) { user in
                VStack {
                    Text(user.name)
                    Text(user.email)
                }
            }
        }
        .onAppear {
            vm.fetchUsers()
        }
    }
}

#Preview {
    UserListView()
}
