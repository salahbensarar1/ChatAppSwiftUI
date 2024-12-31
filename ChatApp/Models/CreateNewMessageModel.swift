//
//  CreateNewMessageModel.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 30..
//

import Foundation
import FirebaseDatabase

class CreateNewMessageModel: ObservableObject {
    //*****************************************************************
    @Published var users: [ChatUser] = []
    @Published var errorMessage: String?
    //*****************************************************************
    init() {
        self.fetchAllUsers()
    }
//***********************************************************************************************************
    private func fetchAllUsers() {
        let databaseRef = Database.database().reference()
        let usersRef = databaseRef.child("users")
        
        // Clear any previous data
        self.users.removeAll()
        
        // Fetch all users from the 'users' node
        usersRef.observeSingleEvent(of: .value) { snapshot in
            // Ensure snapshot contains valid data
            guard let data = snapshot.value as? [String: [String: Any]] else {
                self.errorMessage = "Failed to fetch users: Invalid data format or no users found."
                print(self.errorMessage ?? "")
                return
            }
            
            // Iterate over each user and parse their data
            data.forEach { uid, userData in
                let email = userData["email"] as? String ?? "Unknown Email"
                let profilePictureURL = userData["profilePictureURL"] as? String ?? ""
                
                // Create a ChatUser object and append it to the users array
                if uid != FirebaseManager.shared.auth.currentUser?.uid{
                    self.users.append(ChatUser(uid: uid, email: email, profilePictureURL: profilePictureURL))
                }
                    
                
                
            }
            
            self.errorMessage = "Fetched users successfully"
            print(self.errorMessage ?? "")
        } withCancel: { error in
            self.errorMessage = "Failed to fetch users: \(error.localizedDescription)"
            print(self.errorMessage ?? "")
        }
    }
//***********************************************************************************************************
}
