//
//  MenuTableViewCell.swift
//  Delivery Food
//
//  Created by Дмитрий Скок on 22.06.2023.
//

import UIKit
import SnapKit

final class MenuTableViewCell: UITableViewCell {

    // MARK: - SubView

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Ветчина и грибы"
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 14)
        label.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        return label
    }()

    private lazy var priceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("от 350р", for: .normal)
        button.setTitleColor(UIColor.systemPink, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.borderWidth = 1
        return button
    }()

    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    private func configureLayout() {
        addSubview(menuImageView)
        menuImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(18)
            make.height.width.equalTo(140)
        }

        addSubview(menuStackView)
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(18)
            make.trailing.equalTo(-18)
            make.leading.equalTo(menuImageView.snp.trailing).offset(18)
            make.bottom.equalTo(-68)
        }

        addSubview(priceButton)
        priceButton.snp.makeConstraints { make in
            make.bottom.equalTo(-18)
            make.trailing.equalTo(-18)
            make.height.equalTo(32)
            make.width.equalTo(87)
        }
    }
}
