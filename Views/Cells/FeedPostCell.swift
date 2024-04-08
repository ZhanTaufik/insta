//
//  FeedPostCell.swift
//  Instagram zhan
//
//  Created by Mac Students on 20.02.2024.
//

import SnapKit
import UIKit

class FeedPostCell: UITableViewCell {
    // MARK: - Public
    func configure(with info: FeedPostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInset: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 12
        static let subtitleLabelFontSize: CGFloat = 11
        static let usernameStackToProfielImageOffset: CGFloat = 12
    }
    
    // MARK: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2;
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleLabelFontSize)
        return label
    }()
    
    private let postSettings: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
}

// MARK: - Private methods
private extension FeedPostCell {
    func initialize() {
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackToProfielImageOffset)
        }
        contentView.addSubview(postSettings)
        postSettings.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
}
