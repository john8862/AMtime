//
//  HeaderView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseId = "HeaderView"
    var onSeeAllClicked = {}

    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Popular"
        label.textColor = UIColor(named: "textColor")
        label.numberOfLines = 2
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))

        return label
    }()

    lazy var seeAll: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor(named: "darkPurple"), for: .normal)
        button.addTarget(self, action: #selector(seeAllMovies), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
    }()

    lazy var HStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name, seeAll])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(HStack)

        NSLayoutConstraint.activate([
            HStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            HStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            HStack.topAnchor.constraint(equalTo: topAnchor),
            HStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("Not happening...")
    }

    @objc fileprivate func seeAllMovies() {
        onSeeAllClicked()
    }
}

#Preview() {
    HeaderView()
}