//
//  newMessageButton.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 20..
//

import SwiftUI

struct newMessageButton: View {
    var body: some View {
        HStack{
            Spacer()
            Text("+ New Message")
                .font(.system(size: 16 ,weight : .bold))
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.vertical)
            .background(Color.blue)
            .cornerRadius(24)
            .padding(.horizontal)
            .shadow(radius: 15)
    }
}

