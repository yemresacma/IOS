//
//  BottomStackView.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 23.04.2021.
//

import UIKit

class BottomStackView: UIStackView {
    
    // MARK: - Properties
    let refreshButton = UIButton(type: .system)
    let dislikeButton = UIButton(type: .system)
    let superLikeButton = UIButton(type: .system)
    let likeButton = UIButton(type: .system)
    let boostButton = UIButton(type: .system)
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        distribution = .fillEqually
        
        // set buttons' images
        refreshButton.setImage(#imageLiteral(resourceName: "refresh_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        dislikeButton.setImage(#imageLiteral(resourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        superLikeButton.setImage(#imageLiteral(resourceName: "super_like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        boostButton.setImage(#imageLiteral(resourceName: "boost_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        
        // fill the stack view
        [refreshButton, dislikeButton, superLikeButton, likeButton, boostButton]
            .forEach() { view in
                addArrangedSubview(view)
            }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
}
