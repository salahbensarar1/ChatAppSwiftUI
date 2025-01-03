//
//  ChatLogView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 01..
//

import SwiftUI

struct ChatLogView: View {
let chatUser: ChatUser?
    @State var chatText: String = ""
    var body: some View {
        VStack{
            ScrollView {
                
                ForEach(0..<10){num in
                    
                    HStack{
                        Spacer()
                        HStack{
                            Text("Fake message for now \(num)")
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
            HStack(spacing: 18)
            {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(size: 27))
                    .foregroundStyle(Color(.purple))
                //Text("A text message to show the message conntent")
                TextField("Description", text: $chatText)
                Button{
                    print("Message sent : \(chatText)")
                    
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
                           profilePictureURL: "https://res.cloudinary.com/dycj9nypi/image/upload/v1735423266/aqyqqiehp3ityzdbu1ev.jpg"
                       )
                   )
    }
}
