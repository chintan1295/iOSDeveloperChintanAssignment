//
//  HomeDataFetcher.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import Foundation

class HomeDataFetcher {
    
    static let sharedInstance = HomeDataFetcher()

    func getDataSourceForFollowing() -> [UserModel] {
        var followingUsers = [UserModel]()
        for index in 1...30 {
            let strAvatar = "https://i.pravatar.cc/150?img=\(index)"
            followingUsers.append(UserModel(userName: "Following User", email: "username@mailinator.com", imgAvatar: strAvatar, userType: .following))
        }
        return followingUsers
    }
    
    func getDataSourceForFollowers() -> [UserModel] {
        var followerUsers = [UserModel]()
        for index in 30...60 {
            let strAvatar = "https://i.pravatar.cc/150?img=\(index)"
            followerUsers.append(UserModel(userName: "Follower User", email: "username@mailinator.com", imgAvatar: strAvatar, userType: .following))
        }
        return followerUsers
    }
}
