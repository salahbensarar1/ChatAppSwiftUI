//
//  MainMessagesViewModel.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 20..
//

import Foundation
import FirebaseDatabase



//********************************************************************************************************************
struct  ChatUser{
    let uid,email,profilePictureURL: String
    
}


//********************************************************************************************************************

class MainMessagesViewModel : ObservableObject{

//*************************************************************************************
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    @Published var isUserLoggedOut = false
//*************************************************************************************
    func handleSignOut()  {
        isUserLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
            
        
    }
//*************************************************************************************
    init() {
        fetchCurrentUser()
    }
//*************************************************************************************
    
    private func fetchCurrentUser() {
        // Ensure the current user is logged in and has a valid UID
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("No current user UID found.")
            return
        }
        
        // Log the UID for debugging purposes
        print("Fetching data for UID: \(uid)")
        
        //self.errorMessage = "\(uid)"
        
        // Reference to the Realtime Database
        let databaseRef = Database.database().reference()
        let userRef = databaseRef.child("users").child(uid)
        
        // Fetch data from Realtime Database for the given UID
        userRef.observeSingleEvent(of: .value) { snapshot in
            print("Snapshot: \(snapshot)") // Log the raw snapshot value
            
            // Ensure the snapshot contains valid user data
            guard snapshot.exists() else {
                print("Snapshot does not exist for UID: \(uid).")
                return
            }
            
            guard let data = snapshot.value as? [String: Any] else {
                print("Snapshot does not contain valid user data.")
                return
            }
            
            // Use the UID from the snapshot key and fetch additional attributes
            let email = data["email"] as? String ?? "Unknown Email"
            let profilePictureURL = data["profilePictureURL"] as? String ?? "No Profile Picture URL"
            
            // Log extracted user data
            print("User Data: \(data)")
            print("Email: \(email), Profile Picture URL: \(profilePictureURL)")
            
            // Create a ChatUser object
            self.chatUser = ChatUser(uid: snapshot.key, email: email, profilePictureURL: profilePictureURL)
            
            // Handle the chat user object as needed (e.g., save to a property)
            // Example: self.currentUser = chatUser
            //print("ChatUser created: \(chatUser)")
            
        } withCancel: { error in
            // Handle errors during the fetch operation
            print("Failed to fetch current user: \(error.localizedDescription)")
        }
    }
//*************************************************************************************
    
}
