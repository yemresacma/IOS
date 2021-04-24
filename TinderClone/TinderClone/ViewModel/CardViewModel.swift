//
//  CardViewModel.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 24.04.2021.
//

import UIKit

class CardViewModel {
    
    // MARK: - Properties
    let user: User
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    var imageToShow: UIImage?
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font:UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: " \(user.age)", attributes: [.font:UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
    }
    
    // MARK: - Actions
    func showNextPhoto() {
        guard imageIndex < user.images.count  - 1 else {return}
        self.imageIndex += 1
        self.imageToShow = user.images[imageIndex]
    }
    
    func showPreviousPhoto() {
        guard imageIndex > 0 else {return}

        self.imageIndex -= 1
        self.imageToShow = user.images[imageIndex]
    }
}
