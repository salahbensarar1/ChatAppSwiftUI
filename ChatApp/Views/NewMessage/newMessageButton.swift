//
//  newMessageButton.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 20..
//

import SwiftUI

struct newMessageButton: View {
    @State var ShouldShowNewMessageScreen = false
    @Binding var ShouldNavigateToChatView: Bool
    @Binding var chatUser: ChatUser?

    var body: some View {
        Button {
            ShouldShowNewMessageScreen.toggle()
        } label: {
            HStack {
                Spacer()
                Text("+ New Message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color.blue)
            .cornerRadius(24)
            .padding(.horizontal)
            .shadow(radius: 15)
        }
        .fullScreenCover(isPresented: $ShouldShowNewMessageScreen, onDismiss: nil) {
            CreateNewMessageView(didSelectNewUser: { user in
                print("\(user.email)")
                self.chatUser = user // Update the selected user
                self.ShouldNavigateToChatView.toggle() // Trigger navigation
            })
        }
        .navigationBarHidden(true)
    }
}
