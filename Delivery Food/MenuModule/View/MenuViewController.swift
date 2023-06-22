//
//  MenuViewController.swift
//  Delivery Food
//
//  Created by Дмитрий Скок on 22.06.2023.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    // MARK: Subviews

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "menuCell")
        return tableView
    }()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationBar()
        configureLayout()
    }

    // MARK: - Private

    private func configureLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationItem.leftBarButtonItem = .init(title: "Москва ▾", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black

    }
}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? MenuTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}
