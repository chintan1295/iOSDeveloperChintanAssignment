//
//  ViewControllerExtension.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertWithTitleAndMessage(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AppConstant.actionOk, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
