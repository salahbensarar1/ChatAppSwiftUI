//
//  MainMessagesView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 17..
//

import SwiftUI

struct MainMessagesView: View {
    @ObservedObject private var vm = MainMessagesViewModel()
    @State var ShouldNavigateToChatView = false
    @State var chatUser: ChatUser?
    var body: some View {
        NavigationView{
            VStack{
                //Text("User : \(vm.chatUser?.email ?? "Unknown")")
                customNavBar()
                MessageView()
                
                NavigationLink("", isActive: $ShouldNavigateToChatView){
                    ChatLogView(chatUser: self.chatUser)
                }
             
                
            }
            .overlay(
         
                newMessageButton(
                                  ShouldNavigateToChatView: $ShouldNavigateToChatView,
                                  chatUser: $chatUser
                              ),alignment: .bottom)

            
        }
    }
    
    
}


#Preview {
    MainMessagesView()
}
