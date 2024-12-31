//
//  CreateNewMessageView.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 30..
//

import SwiftUI
import SDWebImageSwiftUI

struct CreateNewMessageView: View {
    let didSelectNewUser: (ChatUser) -> ()
    @ObservedObject var vm = CreateNewMessageModel()
    @State var ShouldShowLogOutOptions = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(vm.users) {num in
                
                    Button{
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(num)
                    }label:{
                        HStack{
                            WebImage(url: URL(string:num.profilePictureURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 52,height: 52)
                                .shadow(radius: 10)
                                .clipShape(Circle())
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(style: StrokeStyle(lineWidth: 1.5 )))
                            Text("\(num.email)")
                            Spacer()
                        }.padding(.horizontal )
                        Divider()
                            .padding(.vertical, 8)
                        //Text("user \(num.email)")
                        //Text(vm.users[num].email)
                    }.foregroundStyle(Color.black)
               
                
                }
            }.navigationTitle(Text("New Message"))
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button{
                            presentationMode.wrappedValue.dismiss()

                        }label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}

#Preview {
    CreateNewMessageView(didSelectNewUser: { user in
        print("\(user.email)")
    })
    //MainMessagesView()
}
