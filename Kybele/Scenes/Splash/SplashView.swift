//
//  SplashView.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

final class SplashView: UIView {

    // MARK: - Properties
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.image = UIImage(named: "splashIcon")!
        return imageView
    }()

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)

        [backgroundImageView, logoImageView].forEach(addSubview(_:))

        backgroundImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        logoImageView.snp.makeConstraints { $0.center.equalToSuperview() }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
