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
                            .foregroundStyle(Color(.darkGray))
                            
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color.purple.opacity(0.9)]),
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading
                        )
                        .cornerRadius(8)
                    )
                    .cornerRadius(10)
                }.padding(.horizontal)
                    .padding(.top, 8)
            }
            HStack{ Spacer()}
        }
        .background(Color(.init(white: 0.91, alpha: 1)))
    }
}
