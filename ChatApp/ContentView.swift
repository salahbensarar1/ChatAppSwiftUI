import SwiftUI


struct ContentView: View {
    @State private var isLoginMode = false
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.purple.opacity(1.2)]), startPoint: .trailing, endPoint: .bottomLeading)
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
                            
                        } label: {
                            Image(systemName: isLoginMode ? "person.fill" : "person.fill.badge.plus")
                                .font(.system(size: 72))
                                .foregroundColor(.purple.opacity(1.2))
                                .padding()
                                .frame(height: 110)
                                .scaleEffect(1.0)
                                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: 1.0)
                            
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
                                .background(Color.purple.opacity(1.2))
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: .purple.opacity(0.4), radius: 7,x: 15, y: 20)
                            }
                            
                        HStack {
                         
                               
                               Text("Or continue with")
                                   .font(.subheadline)
                                   .foregroundColor(.secondary)
                                   .padding(.horizontal, 8)
                               
                              
                           }
                        .padding()
                        HStack(spacing: 31){
                            Button(action: {
                                print("Google Authentication")
                            }){
                                Image("google_ic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 32)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            Button(action: {
                                print("Facebook Authentication")
                            }){
                                Image("facebook_ic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    
                                
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 32)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            Button(action: {
                                print("Apple Authentication")
                            }){
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.black)
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 32)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
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
                            .foregroundColor(.purple.opacity(1.2))
                                            
                                    }
                                }
             
                
            }
            
        }
        
    }
    private func handleAction(){
        print(isLoginMode ? "Should Log into Firebase with existing credentials" : "Should create a new account")
    }
}

#Preview {
    ContentView()
}
