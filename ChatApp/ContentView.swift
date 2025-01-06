import SwiftUI
import FirebaseDatabase
import Firebase
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseFirestore
import GoogleSignInSwift
//Basically this is the login view  with some methods for sign In with google, Uploead pics to cloudinary and then save it to database

class FirebaseManager: NSObject {
    let auth: Auth
    static let shared = FirebaseManager()
    
    let firestore: Firestore
    override init() {
        self.firestore = Firestore.firestore() 
        self.auth = Auth.auth()
        super.init()
    }
    
}



struct ContentView: View {
//********************************************************************************************************
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var isLoginMode = false
    @State private var showImagePicker = false
    @State private var email = ""
    @State private var password = ""
    @State var shouldShowImagePicker = false
    @Environment(\.dismiss) var dismiss
    @State private var isLoggedIn = false
    
    let didCompleteLoginProcess: () -> ()
//********************************************************************************************************

    
    
    

    var body: some View {
        if isLoggedIn {
                   // Show MainMessagesView after successful login
                   MainMessagesView()
               }
        else {
            NavigationView {
                ZStack {
                    
                    LinearGradient(gradient: Gradient(colors: [Color.white,                                 Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2)]), startPoint: .trailing, endPoint: .bottomLeading)
                        .ignoresSafeArea()
                       ScrollView {
                           VStack {
                               Picker(selection: $isLoginMode, label: Text("Text Picker")) {
                                   Text("Login")
                                       .tag(true)
                                Text("Create Account")
                                    .tag(false)
                                    
                            }
                            .padding()
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                            Button {
                                isLoginMode ? nil : shouldShowImagePicker.toggle()
                            } label: {
                                VStack{
                                    if let image = self.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 128,height: 128)
                                            .cornerRadius(64)
                                    }else{
                                        Image(systemName: isLoginMode ? "person.fill" : "person.fill.badge.plus")
                                            .font(.system(size: 72)
                                            )
                                            .foregroundColor(                                Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2))
                                            .padding()
                                            .frame(height: 110)
                                            .scaleEffect(1.0)
                                            .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: 1.0)
                                    }
                                }.overlay(RoundedRectangle(cornerRadius: 64)
                                    .stroke(Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(0.5), lineWidth: 2))
                               
                                
                            }
                            
                            
                            
                            HStack(alignment: .top){
                            Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            TextField("Email", text: $email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                
                                
    //                            .padding(EdgeInsets(top: 10, leading: 4, bottom: 0, trailing: 4))
    //                            .autocapitalization(.none)
    //                            .textFieldStyle(RoundedBorderTextFieldStyle())
    //                            .keyboardType(.emailAddress)
                                
                                }
                            
                            .padding()
                            .overlay(
                              RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                                
                            )
                            Spacer().padding(EdgeInsets.init(top: 7, leading: 0, bottom: 0, trailing: 0))
                            
                            HStack(alignment: .top)
                            {
                                Image(systemName: "lock.circle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                SecureField("Password", text: $password)
                                   .autocapitalization(.none)
                                    
                                
                            }
                            .padding()
                            .overlay(
                              RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                            
                            
                            Spacer().padding(EdgeInsets.init(top: 12, leading: 0, bottom: 0, trailing: 0))
                                
                            
              
                                Button {
                                    handleAction()
                                    
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text(isLoginMode ? "Login" : "Create Account")
                                            .font(.custom("Gilroy", size: 22).weight(.bold))
                                            .foregroundColor(.white)
                                            .padding()
                                           
    //                                        .clipShape(RoundedRectangle(cornerRadius: 35))
                                        Spacer()
                                        
                                    }
                                    .background(Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(color: Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(0.4), radius: 7,x: 15, y: 20)
                                }
                                
                            HStack {
                             
                                   
                                   Text("Or continue with")
                                       .font(.subheadline)
                                       .foregroundColor(.secondary)
                                       .padding(.horizontal, 8)
                                   
                                  
                               }
                            .padding()
                            HStack(spacing: 31){
                                Button(action: {signInWithGoogle()}){
                                   
                                    Image("google_ic")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 24)
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 32)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
    //                            Button(action: {
    //                                print("Facebook Authentication")
    //                            }){
    //                                Image("facebook_ic")
    //                                    .resizable()
    //                                    .aspectRatio(contentMode: .fit)
    //                                    .frame(width: 24, height: 24)
    //
    //
    //                            }
    //                            .padding(.vertical, 14)
    //                            .padding(.horizontal, 32)
    //                            .background(Color(.systemGray6))
    //                            .cornerRadius(8)
    //                            Button(action: {
    //                                print("Apple Authentication")
    //                            }){
    //                                Image(systemName: "apple.logo")
    //                                    .resizable()
    //                                    .aspectRatio(contentMode: .fit)
    //                                    .foregroundColor(.black)
    //                                    .frame(width: 24, height: 24)
    //                            }
    //                            .padding(.vertical, 14)
    //                            .padding(.horizontal, 32)
    //                            .background(Color(.systemGray6))
    //                            .cornerRadius(8)
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text(isLoginMode ? "if you don't have an account" : "")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Button(action: {
                                    isLoginMode.toggle()
                                }) {
                                    Text(isLoginMode ? "You can register here!" : "")
                                        .font(.subheadline)
                                        .foregroundColor(.blue)
                                        .padding()
                                        .underline()
                                }
                                
                            }
                            Text(self.loginStatusMessage)
                                .foregroundStyle(.red)
                                .padding()
                            
                         
                        }
                        .padding()
                    }
                    
                    Spacer()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                                Text(isLoginMode ? "Login" : "Create Account")
                                .font(.custom("Gilroy", size: 32))
                                .fontWeight(.light)
                                .padding(.top)
                                .shadow(color: .gray.opacity(0.7), radius: 7,x: 17, y: 15)
                                .foregroundColor(Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2))
                                                
                                        }
                                    }
                 
                    
                }
                
            }
            .navigationViewStyle(StackNavigationViewStyle ())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
                //Text("Text here")
                ImagePicker(image: $image)
        }
        }
        
    }

//*******************************************************************************************************************
    private func handleAction(){
        if isLoginMode{
            
            loginUser()
        }else{
            CreateNewAccount()
        }
    }
//*******************************************************************************************************************
    @State var loginStatusMessage = " "
    @State var image: UIImage?
//*******************************************************************************************************************
    private func CreateNewAccount(){ //Create a brand new Firebase Account
    
        guard !email.isEmpty, !password.isEmpty else {
                    loginStatusMessage = "Email and password cannot be empty."
                    return
                }

                FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        loginStatusMessage = "Error creating user: \(error.localizedDescription)"
                        return
                    }

                    guard let uid = result?.user.uid else {
                        loginStatusMessage = "Error: Failed to retrieve user ID."
                        return
                    }

                    // If no image is provided, just save the user data
                    guard let imageData = image?.jpegData(compressionQuality: 0.5) else {
                        saveUserData(uid: uid, email: email, profilePictureURL: nil)
                        return
                    }

                    // Upload the image to Cloudinary
                    uploadToCloudinary(imageData: imageData, fileName: "\(uid).jpg") { result in
                        switch result {
                        case .success(let profilePictureURL):
                            self.saveUserData(uid: uid, email: self.email, profilePictureURL: profilePictureURL)
                        case .failure(let error):
                            self.loginStatusMessage = "Error uploading image: \(error.localizedDescription)"
                        }
                    }
                }
    }
//*******************************************************************************************************************
    private func loginUser() {
           guard !email.isEmpty, !password.isEmpty else {
               loginStatusMessage = "Email and password cannot be empty."
               return
           }

           FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
               if let error = error as NSError? {
                   switch AuthErrorCode(rawValue: error.code) {
                   case .invalidEmail:
                       loginStatusMessage = "Invalid email address."
                   case .wrongPassword:
                       loginStatusMessage = "Incorrect password. Please try again."
                   case .userNotFound:
                       loginStatusMessage = "No account found for this email."
                   case .emailAlreadyInUse:
                       loginStatusMessage = "Email already in use. Try logging in instead."
                   default:
                       loginStatusMessage = "Error: \(error.localizedDescription)"
                   }
                   return
               }
               loginStatusMessage = "Welcome back, \(result?.user.email ?? "User")!"
               isLoggedIn = true
           }
           }
    
//*******************************************************************************************************************
//*******************************************************************************************************************
    private func saveUserData(uid: String, email: String, profilePictureURL: String?) {
         let db = Database.database().reference()
         let userData = [
             "email": email,
             "profilePictureURL": profilePictureURL ?? ""
         ]

         db.child("users").child(uid).setValue(userData) { error, _ in
             if let error = error {
                 self.loginStatusMessage = "Error saving user data: \(error.localizedDescription)"
             } else {
                 self.loginStatusMessage = "Account created successfully!"
             }
         }
     }
    
//*******************************************************************************************************************
    private func signInWithGoogle() {
       Task {
         if await viewModel.signInWithGoogle() == true {
           dismiss()
         }
       }
     }
//*******************************************************************************************************************
    func saveUserData(uid: String, email: String, profilePictureURL: String, completion: @escaping (Bool) -> Void) {
        let db = Database.database().reference()
        let userData = [
            "email": email,
            "profilePictureURL": profilePictureURL
        ]
        db.child("users").child(uid).setValue(userData) { error, _ in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
                completion(false)
            } else {
                print("User data saved successfully!")
                completion(true)
            }
        }
    }
//*******************************************************************************************************************
}

#Preview {
    ContentView(didCompleteLoginProcess: {
        
    })
}
