//
//  customNavBar.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 20..
//

import SwiftUI
import SDWebImageSwiftUI

struct customNavBar: View {
    @State var ShouldShowLogOutOptions = false
    @ObservedObject private var vm = MainMessagesViewModel()
    var body: some View {
        HStack{
            WebImage(url: URL(string: vm.chatUser?.profilePictureURL ?? " "))
                .resizable()
                .scaledToFill()
                .frame(width: 52,height: 52)
                .shadow(radius: 10)
                .clipShape(Circle())
                
            
                
//            Image(systemName: "person.fill")
//                .font(.system(size: 34, weight: .heavy))
            
            VStack(alignment: .leading, spacing: 4){
                let email = vm.chatUser?.email.replacingOccurrences(of: "@gmail.com", with: " ") ?? "Unknown"
                Text("\(email)")
                    .font(.system(size: 24,weight: .bold))
                
                HStack{
                
                    Circle()
                        .foregroundStyle(Color(.green))
                        .frame(width: 14,height: 14)
                    Text("Online")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundStyle(Color(.lightGray))
                }
            }
           
            Spacer()
            Button{
                ShouldShowLogOutOptions.toggle()
            }label:{
                Image(systemName: "gear")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $ShouldShowLogOutOptions){
            .init(title: Text("Settings"),message: Text("What do you want to do ?"),buttons: [
                .destructive(Text("Sign Out"),action: {
                    print("handle sign out")
                    vm.handleSignOut()
                }),
                .cancel()
            ])
        
        }
        .fullScreenCover(isPresented: $vm.isUserLoggedOut, onDismiss: nil){
            ContentView(didCompleteLoginProcess: {
                self.vm.isUserLoggedOut = false
                self.vm.fetchCurrentUser()
            })
        }
    }
}

