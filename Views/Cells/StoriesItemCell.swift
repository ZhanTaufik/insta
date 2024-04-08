//
//  StoriesItemCell.swift
//  Instagram zhan
//
//  Created by Mac Students on 20.02.2024.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        storiesRing.isHidden = !info.isNewStory
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let imageSize:  CGFloat = 76
        static let imageToCellInset: CGFloat = 5
        
        static let storiesRingSize: CGFloat = 90
        
        static let labelToCellInset: CGFloat = 0
        static let imageToLabelOffset: CGFloat = 6
        static let usernameFontSize: CGFloat = 11
        
        static let plusButtonSize: CGFloat = 20
    }
    
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plusImage"), for: .normal)
        return button
    }()
    
    private let storiesRing: UIImageView = {
        let ring = UIImageView()
        ring.image = UIImage(named: "StoriesRing")
        return ring
    }()
    
}

//MARK: - Private methods
private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        contentView.addSubview(storiesRing)
        storiesRing.snp.makeConstraints{ make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.storiesRingSize)
        }
    }
}
