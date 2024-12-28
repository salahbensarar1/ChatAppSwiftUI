//
//  MainMessagesView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 17..
//

import SwiftUI

struct MainMessagesView: View {
    @ObservedObject private var vm = MainMessagesViewModel()
    //@State var ShouldShowLogOutOptions = false
    var body: some View {
        NavigationView{
            VStack{
                //Text("User : \(vm.chatUser?.email ?? "Unknown")")
                customNavBar()
                MessageView()
                //.navigationTitle("Main Messages View")
                
            }
            .overlay(
                newMessageButton()
                ,alignment: .bottom)
//                Button{
//                    print("New Message handled")
//                
//            }label: {
//                newMessageButton()
//                
//            }, alignment: .bottom)
//            .navigationBarHidden(true)
            
        }
    }
}


#Preview {
    MainMessagesView()
}
