//
//  CardViewModel.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 24.04.2021.
//

import UIKit

struct CardViewModel {
    let user: User
    let userInfoText: NSAttributedString
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font:UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: " \(user.age)", attributes: [.font:UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
    }
}
