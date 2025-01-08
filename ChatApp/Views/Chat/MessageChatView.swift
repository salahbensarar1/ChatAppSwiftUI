//
//  MessageChatView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 03..
//

import SwiftUI

struct MessageChatView: View {
    @ObservedObject var vm: ChatLogViewModel
    var body: some View {
        ScrollView {
            ScrollViewReader{ scrollviewproxy in
                VStack{
                    ForEach(vm.chatMessages) { message in
                        VStack{
                            if message.fromId == FirebaseManager.shared.auth.currentUser?.uid{
                                HStack{
                                    Spacer()
                                    HStack{
                                        Text(message.text)
                                            .foregroundStyle(Color(.white))
                                            
                                    }
                                    .padding()
                                    .background(
                                        
                //                        LinearGradient(
                //                            gradient: Gradient(colors: [Color.white, Color.purple.opacity(0.9)]),
                //                            startPoint: .topTrailing,
                //                            endPoint: .bottomLeading
                //                        )
                                        Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255)
                                        .cornerRadius(18)
                                    )
                                    .cornerRadius(10)
                                }
                            } else {
                                HStack{
                                    HStack{
                                        Text(message.text)
                                            .foregroundStyle(Color(.black))
                                            
                                    }
                                    .padding()
                                    .background(
                                        Color(.white)
                                    )
                                    .cornerRadius(10)
                                    Spacer()
                                }
                            }
                        }.padding(.horizontal)
                            .padding(.top, 8)
                      
                    }
                    HStack{ Spacer()}
                        .id("Empty")
                }
                .onReceive(vm.$count){ _ in
                    withAnimation (.easeInOut(duration: 0.5)){
                        
                        
                        scrollviewproxy.scrollTo("Empty", anchor: .bottom)
                    }
            }
          
                    
                }
        }
        .background(
//            Color(red: 81 / 255, green: 68 / 255, blue: 172 / 255)
            LinearGradient(
                                   gradient: Gradient(colors: [Color.white,
                                                                Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2)]),
                                   startPoint: .trailing,
                                   endPoint: .bottomLeading
                               )
        )
    }
}
