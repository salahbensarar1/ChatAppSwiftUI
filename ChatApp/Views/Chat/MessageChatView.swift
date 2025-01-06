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
            ForEach(vm.chatMessages) { message in
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
                }.padding(.horizontal)
                    .padding(.top, 8)
            }
            HStack{ Spacer()}
        }
        .background(
//            Color(red: 81 / 255, green: 68 / 255, blue: 172 / 255)
            LinearGradient(
            gradient: Gradient(colors: [Color.white, Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(0.9)]),
            startPoint: .leading,
            endPoint: .bottomTrailing
        )
        )
    }
}
