//
//  ChatLogView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 01..
//

import SwiftUI

struct ChatLogView: View {
let chatUser: ChatUser?
    var body: some View {
        ScrollView {
            ForEach(0..<10){num in
                
                HStack{
                    Spacer()
                    HStack{
                        Text("Fake message for now \(num)")
                            .foregroundStyle(.white)
                            
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }.padding(.horizontal)
                    .padding(.top, 8)
            }
            HStack{ Spacer()}
        }
        .background(Color(.init(white: 0.71, alpha: 1)))
        Text("A text message to show the message conntent")
        .navigationTitle(chatUser?.email ?? "")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
   // MainMessagesView()
    NavigationView {
        ChatLogView(
                       chatUser: ChatUser(
                           uid: "ytva5cI8CMfW8sUh5KeUS2AxvkV2",
                           email: "sa.bensarar@gmail.com",
                           profilePictureURL: "https://example.com/profile-picture.jpg"
                       )
                   )
    }
}
