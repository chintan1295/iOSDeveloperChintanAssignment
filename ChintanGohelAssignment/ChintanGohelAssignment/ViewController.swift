//
//  ViewController.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    var firstName = ""
    var lastName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginWithTwitterPressed(_ sender: Any) {
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if (session != nil) {
                self.firstName = session?.userName ?? ""
                self.lastName = session?.userName ?? ""
                let client = TWTRAPIClient.withCurrentUser()
                client.requestEmail { email, error in
                    if (email != nil) {
                        print("signed in as \(String(describing: session?.userName))");
                        let firstName = session?.userName ?? ""   // received first name
                        let lastName = session?.userName ?? ""  // received last name
                        let recivedEmailID = email ?? ""   // received email
                        print("\(firstName) \(lastName) \(recivedEmailID)")
                    }else {
                        print("error: \(String(describing: error?.localizedDescription))");
                    }
                }
            }else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        }

    }
    
}

