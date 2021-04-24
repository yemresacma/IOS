//
//  HomeViewController.swift
//  TinderClone
//
//  Created by YUNUS EMRE SAÇMA on 22.04.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomStackView()
    private let deckView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        return view
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureDeckCards()
    }
}

// MARK: - Helpers
extension HomeViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        let stack = UIStackView(arrangedSubviews: [topStack, deckView, bottomStack])
        stack.axis = .vertical
        view.addSubview(stack)
        
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        // stack.bringSubviewToFront(deckView)
    }
    
    func configureDeckCards() {
        let cardView1 = CardView()
        let cardView2 = CardView()
        
        deckView.addSubview(cardView1)
        deckView.addSubview(cardView2)

        cardView2.fillSuperview()
    }
}
