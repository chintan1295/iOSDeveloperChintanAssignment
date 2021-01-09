//
//  TwitterDataFetcher.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import Foundation
import SSTwitterLogin

class TwitterDataFetcher {
    
    static let sharedInstance = TwitterDataFetcher()

    func signInWithTwitter(completionHandler: @escaping (_ isSuccess: Bool, _ error: Error?) -> ()) {
        TwitterLoginHelper.sharedInstance.doLoginWithTwitter { (isSuccess, error) in
            if !isSuccess {
                TwitterLoginHelper.sharedInstance.logoutFromTwitter()
            }
            completionHandler(isSuccess, error)
        }
    }
    
    func getUserDetails(completion:@escaping (_ userData: TwitterUserData?, _ error: Error?) -> ()) {
        TwitterLoginHelper.sharedInstance.getLoggedInUserDetailswith(completion: { (userData, error) in
            completion(userData, error)
        })
    }
}


