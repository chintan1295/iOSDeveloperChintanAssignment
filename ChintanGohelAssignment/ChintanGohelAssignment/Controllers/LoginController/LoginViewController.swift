//
//  LoginViewController.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//
public struct AnimationControls {
    static let duration: Double = 0.3
    static let delay: Double = 0.3
}


import UIKit
import SSTwitterLogin

class LoginViewController: UIViewController {
    @IBOutlet weak var lblLoginTitle: UILabel!
    @IBOutlet weak var btnLoginWithTwitter: UIButton!
    @IBOutlet weak var btnShowHome: UIButton!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.customiseViewForTheme()
    }
    
    
    override func viewDidLayoutSubviews() {
        utility.applyCornerRadius(control: btnLoginWithTwitter, radius: 5.0)
        utility.applyCornerRadius(control: btnShowHome, radius: 5.0)
    }

    //MARK: Apply Theme
    
    func customiseViewForTheme() {
        //Amend animation duration and delay from animation controls on top
        utility.applyThemeShadowScreenTitle(titleLabel: lblLoginTitle, color: UIColor.darkGray, shadoRadius: 2.0, oppacity: 0.2)
        utility.applyPulsateAnimation(button: btnLoginWithTwitter)
        utility.applyPulsateAnimation(button: btnShowHome)
    }

    //MARK: Controller Actions
    
    @IBAction func btnLoginWithTwitterPressed(_ sender: Any)  {
        TwitterDataFetcher.sharedInstance.signInWithTwitter { (isSuccess, error) in
            if isSuccess {
                TwitterDataFetcher.sharedInstance.getUserDetails { (userData, error) in
                    if userData != nil {
                        print("UserData: userID = \(userData?.userID ?? 0)")
                        print("UserData: email = \(userData?.email ?? AppConstant.testEmailToDisplay)")
                        
                        //Navigation to details page will be from here after getting resonse data from twitter, But unfortunately i am not able to get data from api somehow so was not able to test further scenario
                    } else {
                        self.showAlertWithTitleAndMessage(title: AppConstant.alertTitle, message: error?.localizedDescription ?? "")
                    }
                }
            } else {
                self.showAlertWithTitleAndMessage(title: AppConstant.alertTitle, message: error?.localizedDescription ?? "")
            }
        }
    }
    
    @IBAction func btnShowHomePressed(_ sender: Any)  {
        let storyboard = UIStoryboard(name: AppConstant.homeStoryboard, bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}
