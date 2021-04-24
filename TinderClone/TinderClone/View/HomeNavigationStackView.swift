//
//  HomeStackView.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 23.04.2021.
//

import UIKit

class HomeNavigationStackView: UIStackView {
    
    // MARK: - Properties
    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let tinderIcon = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        tinderIcon.contentMode = .scaleAspectFit // not to corrupt image height-width rate
        
        // set buttons' images
        settingsButton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "top_messages_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        
        // fill the stack view, NOTE: UIView(dummy view) is used to make space between images
        [settingsButton, UIView(), tinderIcon, UIView(), messageButton]
            .forEach() { view in
                addArrangedSubview(view)
            }
        
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder)
    {
        fatalError("init(coder) not implemented")
    }
}
