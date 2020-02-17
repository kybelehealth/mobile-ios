//
//  SpashViewModel.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

final class SplashViewModel: Interactor {

    // MARK: - Properties
    override init() {
        super.init()
        fetchData()
    }
}

// MARK: - API
extension SplashViewModel: SplashApi {

    func fetchData() {

    }
}
