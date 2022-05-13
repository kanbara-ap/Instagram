//
//  PostData.swift
//  Instagram
//
//  Created by WEBSYSTEM-MAC31 on 2022/05/13.
//

import UIKit
import Firebase

class PostData: NSObject{
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isliked: Bool = false
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        let postDic = document.data()
        self.name = postDic["name"] as? String
        self.caption = postDic["caption"] as? String
        let timestamp = postDic["Date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String]{
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            if self.likes.firstIndex(of:myid) != nil {
                self.isliked = true
            }
            
        }
    }
}
