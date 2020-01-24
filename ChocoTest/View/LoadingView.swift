//
//  LoadingView.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let shared: LoadingView = LoadingView()
    private var overlayView : LoadingView! = nil
    private var activityIndicator = UIActivityIndicatorView()

    func showLoading() {
        if let win = UIApplication.shared.getWindow(),
            !win.subviews.contains(where: { $0 is LoadingView }) {
            overlayView = LoadingView(frame: win.bounds)
            overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            overlayView.activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            overlayView.activityIndicator.startAnimating()
            overlayView.activityIndicator.center = overlayView.center
            overlayView.addSubview(overlayView.activityIndicator)
            win.addSubview(overlayView)
        }
    }

    func hideLoading() {
        if overlayView != nil {
            overlayView.activityIndicator.stopAnimating()
            overlayView.removeFromSuperview()
        }
    }
}
