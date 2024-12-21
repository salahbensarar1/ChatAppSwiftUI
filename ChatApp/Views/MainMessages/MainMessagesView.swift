//
//  MainMessagesView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 17..
//

import SwiftUI

struct MainMessagesView: View {
    //@State var ShouldShowLogOutOptions = false
    var body: some View {
        NavigationView{
            VStack{
                customNavBar()
                MessageView()
                //.navigationTitle("Main Messages View")
                
            }
            .overlay(
                Button{
                    print("New Message handled")
                
            }label: {
                newMessageButton()
            }, alignment: .bottom)
            .navigationBarHidden(true)
            
      
        }
    }
}


#Preview {
    MainMessagesView()
}
