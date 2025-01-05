//
//  ChatLogView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 01..
//

import SwiftUI
import FirebaseFirestore
import Firebase

//*************************************************************************
struct ChatLogView: View {

//****************************************************
let chatUser: ChatUser?
    @ObservedObject var vm: ChatLogViewModel
    init(chatUser: ChatUser?){
        self.chatUser = chatUser
        self.vm = .init(chatUser: chatUser)
    }

//****************************************************
    
    var body: some View {
        VStack{
            MessageChatView(vm: vm) 
            BottomBarView(vm: vm)
        }
     
       
        .navigationTitle(chatUser?.email ?? "")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}


//*************************************************************************

#Preview {
   // MainMessagesView()
    NavigationView {
    
        ChatLogView(
                       chatUser: ChatUser(
                           uid: "ytva5cI8CMfW8sUh5KeUS2AxvkV2",
                           email: "sa.bensarar@gmail.com",
                           profilePictureURL: "https://res.cloudinary.com/dycj9nypi/image/upload/v1735423266/aqyqqiehp3ityzdbu1ev.jpg"
                       )
                   )
    }
}
