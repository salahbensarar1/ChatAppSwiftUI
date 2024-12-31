import SwiftUI
import FirebaseCore

@main
struct ChatAppApp: App {
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
 
    // Initialize Firebase in the App's initializer
    init() {
        print("Configuring Firebase...")
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(didCompleteLoginProcess: {
                
            })
                .environmentObject(authenticationViewModel) // Provide the AuthenticationViewModel
        }
    }
}

 
