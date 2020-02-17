//
//  LoginTermsView.swift
//  Kybele
//
//  Created by Rufat Mirza on 17.02.2020.
//  Copyright © 2020 Rufat Mirza. All rights reserved.
//

import UIKit

final class LoginTermsView: UIView {

    // MARK: - Declaration
    
    let body: UILabel = .make(lines: 0, color: .gray)
    
    // MARK: - Setup

    init() {
        super.init(frame: .zero)
        backgroundColor = .kybeleLightPurple
        
        let scrollView = UIScrollView.makeBouncyScrollView()
        
        addSubview(scrollView)
        scrollView.addSubview(body)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        body.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalTo(self).inset(16)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
