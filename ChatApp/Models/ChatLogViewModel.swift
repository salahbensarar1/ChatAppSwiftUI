//
//  ChatLogViewModel.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2025. 01. 04..
//

import Foundation
import FirebaseFirestore
import Firebase

//*************************************************************************
struct FirebaseConstants{
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
}
//*************************************************************************
struct ChatMessage : Identifiable{
    var id :  String {  documentID  }
    let documentID : String
    let fromId, toId, text : String
    init(documentID: String,data : [String: Any]){
        self.documentID = documentID
        self.fromId = data[FirebaseConstants.fromId] as? String ?? ""
        self.toId = data[FirebaseConstants.toId] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
    }
}
//*************************************************************************
class ChatLogViewModel : ObservableObject {
    @Published var chatText = ""
    let chatUser : ChatUser?
    @Published var chatMessages  = [ChatMessage]()
    //*************************************************************************
    init(chatUser: ChatUser?) {
        self.chatUser = chatUser
        fetchMessages()
    }
    private func fetchMessages(){
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return  } // So here we are saving the id of the current user or who ll send a message to facilitate storing the chat between 2 users by their 2 IDS
        guard let toId = chatUser?.uid else { return  }
        FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromId)
            .collection(toId)
            .order(by: "timestamp")
            .addSnapshotListener{querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                
                
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.chatMessages.append(.init(documentID: change.document.documentID, data: data))
                    }
                    
                })
//                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
//                    let data = queryDocumentSnapshot.data()
//                    //let chatMessage = ChatMessage(data: data)
//                    let docId = queryDocumentSnapshot.documentID
//                    self.chatMessages.append(.init(documentID: docId, data: data))
//                    
//                })
                    
                }
            }
    
//*********************************************************************************************************************************************
    
    func hundleSend(){
        //print(self.chatText)
        
        guard let fromId = FirebaseManager.shared.auth.currentUser?.uid else { return  } // So here we are saving the id of the current user or who ll send a message to facilitate storing the chat between 2 users by their 2 IDS
        guard let toId = chatUser?.uid else { return  }
        // Create a document reference in Firestore for the message
           let document = FirebaseManager.shared.firestore
               .collection("messages")
               .document(fromId)
               .collection(toId)
               .document()
           
           // Prepare the message data
           let messageData: [String: Any] = [
            FirebaseConstants.fromId : fromId,
            FirebaseConstants.toId : toId,
            FirebaseConstants.text : self.chatText,
               "timestamp": Timestamp()
           ]
           
           // Save the message to Firestore
           document.setData(messageData) { error in
               if let error = error {
                   print("Failed to send message:", error.localizedDescription)
                   return
               }
               print("Message sent successfully")
           }
        
        
        let recipientMessageDocument = FirebaseManager.shared.firestore
            .collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
       
        
        recipientMessageDocument.setData(messageData) { error in
            if let error = error {
                print("Failed to send message:", error.localizedDescription)
                return
            }
            print("Message sent successfully")
        }
        self.chatText = ""
    }
//*********************************************************************************************************************************************

}
