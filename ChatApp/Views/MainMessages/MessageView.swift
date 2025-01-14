//
//  MessageView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 20..
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageView: View {
    @ObservedObject private var vm = MainMessagesViewModel()
    var body: some View {
        ScrollView{
            ForEach(0..<10, id: \.self){ num in
                VStack{
                    NavigationLink{
                        Text("Destination")
                        
                    }label:{
                        HStack(spacing: 16){
                            
                            
                            Image(systemName: "person")
                                .font(.system(size: 32))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255),
                                           lineWidth: 1))
                                
                            VStack(alignment: .leading){
                                Text("Username")
                                    .font(.system(size: 14 ,weight : .bold))
                                Text("Message sent to user")
                                    .font(.system(size: 14 ))
                                    .foregroundStyle(Color(.lightGray))
                                
                            }
                            Spacer()
                            Text("22d")
                                .font(.system(size : 14,weight: .semibold))
                        }
                        Divider()
                            .padding(.vertical, 8)
                        
                    }
//                    LinearGradient(
//                                           gradient: Gradient(colors: [Color.white,
//                                                                        Color(red: 88 / 255, green: 76 / 255, blue: 215 / 255).opacity(1.2)]),
//                                           startPoint: .trailing,
//                                           endPoint: .bottomLeading
//                                       )
                 
                }.padding(.horizontal)
            
            }.padding(.bottom, 50)
           
        }
    }
}

