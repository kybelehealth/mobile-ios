//
//  UIView+Loading.swift
//  Kybele
//
//  Created by Rufat Mirza on 14.12.2019.
//  Copyright © 2019 Rufat Mirza. All rights reserved.
//

import UIKit

extension UIView {

  private struct AssociationKeys {
    static var activityIndicatorView = "activityIndicatorView"
  }

  @objc var activityIndicatorView: UIActivityIndicatorView {
    if let activityIndicatorView = objc_getAssociatedObject(
      self, &AssociationKeys.activityIndicatorView) as? UIActivityIndicatorView
    {
      return activityIndicatorView
    }

    let activityIndicatorView = UIActivityIndicatorView(style: .gray)
    activityIndicatorView.hidesWhenStopped = true
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

    addSubview(activityIndicatorView)

    activityIndicatorView.snp.makeConstraints {
        $0.center.equalToSuperview()
    }

    objc_setAssociatedObject(self, &AssociationKeys.activityIndicatorView,
      activityIndicatorView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

    return activityIndicatorView
  }

  func startLoadingIndicatorView(color: UIColor) {
    activityIndicatorView.color = color
    startLoadingIndicatorView()
  }

  @objc func startLoadingIndicatorView() {
    activityIndicatorView.startAnimating()
  }

  @objc func stopLoadingIndicatorView() {
    activityIndicatorView.stopAnimating()
  }
}
