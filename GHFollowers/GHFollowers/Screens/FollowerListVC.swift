//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by David on 28.1.25..
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch (result) {
                case .success(let followers):
                    print ("Followers.count = \(followers.count)")
                    print ("Followers= \(followers)")
                
            case .failure(let errorMessage):
                self.presentGFAlertOnMainThread(title: "Followers failed", message: errorMessage.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
