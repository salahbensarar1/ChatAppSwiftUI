//
//  BottomBarView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 03..
//

import SwiftUI

struct BottomBarView: View {
    //*************************************************
    @ObservedObject var vm : ChatLogViewModel
    //@State var chatText: String = ""
    //*************************************************
    var body: some View {
        HStack(spacing: 18)
        {
            Image(systemName: "photo.on.rectangle.angled")
                .font(.system(size: 27))
                .foregroundStyle(Color(.purple))
            //Text("A text message to show the message conntent")
            TextField("Description", text: $vm.chatText)
            Button{
                vm.hundleSend()
                
            }label: {
                Image(systemName: "paperplane.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(Color(.purple))
               
                    
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}


