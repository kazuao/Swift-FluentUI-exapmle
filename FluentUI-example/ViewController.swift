//
//  ViewController.swift
//  FluentUI-example
//
//  Created by kazunori.aoki on 2022/05/14.
//

import UIKit
import FluentUI

class ViewController: UIViewController {

    let button: Button = {
        let button = Button(style: .primaryOutline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open Drawer", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        let drawerVC = DrawerController(sourceView: view,
                                        sourceRect: view.bounds,
                                        presentationOrigin:  view.frame.size.height,
                                        presentationDirection: .up,
                                        preferredMaximumHeight: 500)

        drawerVC.contentController = ContentVC()

        present(drawerVC, animated: true)
    }
}

final class ContentVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "iOS Academy is great!"
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
