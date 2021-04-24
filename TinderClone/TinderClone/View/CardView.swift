//
//  CardView.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 23.04.2021.
//

import UIKit

enum SwipeDirection: Int {
    case left = -1
    case noDirection = 0
    case right = 1
}

class CardView: UIView {
    
    // MARK: - Properties
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    private let gradiendLayer = CAGradientLayer()
    private let viewModel: CardViewModel
    
    // MARK: - LifeCycle    
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        imageView.image = viewModel.user.images.first
        
        configureGestureRecognizer()
        
        infoLabel.attributedText = viewModel.userInfoText
        
        backgroundColor = .systemPurple
        layer.cornerRadius = 10
        clipsToBounds = true
                
        addSubview(imageView)
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
        // sets the height width according to cardView
        gradiendLayer.frame = self.frame
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder) has not been implemented")
    }
}

// MARK: - Actions
extension CardView {
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {

        switch sender.state {
        case .began:
            superview?.subviews.forEach({
                $0.layer.removeAllAnimations()
            })
        case .changed:
            panCard(sender)
        case .ended:
            resetCardPosition(sender: sender)
        default: break
            
        }
    }

    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        print("TAP ")
    }
}

// MARK: - Helpers
extension CardView {
    func configureGradientLayer() {
        gradiendLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradiendLayer.locations = [0.5, 1.1]
        layer.addSublayer(gradiendLayer)
    }
    
    func configureGestureRecognizer() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(panRecognizer )
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tapRecognizer)
    }
    
    func panCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let degrees = translation.x / 20
        let angle = degrees  * .pi / 180
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    func resetCardPosition(sender: UIPanGestureRecognizer) {
        var direction: SwipeDirection = .noDirection
        
        // if user swiped the card with enough pan distance, assign it direction
        print(sender.translation(in: nil).x)
        if sender.translation(in: nil).x > 100 {
            direction = .right
        } else if (sender.translation(in: nil).x < -100) {
            direction = .left
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if direction != .noDirection {
                let xTranslation = CGFloat(direction.rawValue) * 1000
                let offScreenTransform = self.transform.translatedBy(x: xTranslation, y: 0)
                self.transform = offScreenTransform
            } else {
                self.transform = .identity
            }
        }) { _ in
            if direction != .noDirection {
                self.removeFromSuperview()
            }
        }
        
    }
}
