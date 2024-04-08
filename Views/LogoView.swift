//
//  LogoView.swift
//  Instagram
//
//  Created by Mac Students on 06.02.2024.
//

import SnapKit
import UIKit

class LogoView: UIView {
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let logowidth: CGFloat = 116
        static let logoheight: CGFloat = 65
    }
    
    
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Instagram_logo.svg")
        return view
    }()
}

// MARK: - Private ethods
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logowidth)
            make.height.equalTo(UIConstants.logoheight)
        }
        
    }
}
