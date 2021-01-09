//
//  UserModel.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import Foundation

enum TwitterUserType {
    case notKnown
    case follower
    case following
}

class UserModel {
    var userName : String
    var email : String
    var imgAvatar : String
    var userType : TwitterUserType
    
    init(userName: String, email: String, imgAvatar: String, userType: TwitterUserType) {
        self.userName = userName
        self.email = email
        self.imgAvatar = imgAvatar
        self.userType = .notKnown
    }
}
