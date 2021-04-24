//
//  CardView.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 23.04.2021.
//

import UIKit

class CardView: UIView {
    
    // MARK: - Properties

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Jane Doe", attributes: [.font:UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "  20", attributes: [.font:UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        label.attributedText = attributedText
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = #imageLiteral(resourceName: "lady4c")
        return iv
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    private let gradiendLayer = CAGradientLayer()
    
    // MARK: - LifeCycle    
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        backgroundColor = .systemPurple
        layer.cornerRadius = 10
        clipsToBounds = true
                
        addSubview(imageView)
        imageView.fillSuperview()

        configureGradientLayer()
        
        addSubview(infoLabel)
        infoLabel.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)

        addSubview(infoButton)
        infoButton.setDimensions(height: 40, width: 40)
        infoButton.centerY(inView: infoLabel)
        infoButton.anchor(right: rightAnchor, paddingRight: 16)
    }
    
    override func layoutSubviews() {
        gradiendLayer.frame = self.frame
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder) has not been implemented")
    }
}

// MARK: - Helpers
extension CardView {
    func configureGradientLayer() {
        gradiendLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradiendLayer.locations = [0.5, 1.1]
        layer.addSublayer(gradiendLayer)    }
}
