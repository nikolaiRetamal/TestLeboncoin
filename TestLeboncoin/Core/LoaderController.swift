//
//  LoaderController.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 22/07/2023.
//

import Foundation
import UIKit



class LoaderController: UIViewController {
    private var loaderView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView = UIActivityIndicatorView(style: .large)
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        loaderView.hidesWhenStopped = true
    }

    func showLoader() {
        view.addSubview(loaderView)

        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        loaderView.startAnimating()
    }

    func hideLoader() {
        loaderView.stopAnimating()
        loaderView.removeFromSuperview()
    }
}
