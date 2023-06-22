//
//  MainTabBarController.swift
//  Delivery Food
//
//  Created by Дмитрий Скок on 22.06.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemPink
        setupTabBar()
    }

    // MARK: - Private

    private func setupTabBar() {
        let menuViewController = createVC(viewController: MenuViewController(),
                                          tittle: "Меню",
                                          image: UIImage(systemName: "menucard.fill")
        )
        let contactViewController = createVC(viewController: EmptyViewController(),
                                          tittle: "Контакты",
                                          image: UIImage(systemName: "envelope.fill")
        )
        let profileViewController = createVC(viewController: EmptyViewController(),
                                          tittle: "Профиль",
                                          image: UIImage(systemName: "person.fill")
        )
        let basketViewController = createVC(viewController: EmptyViewController(),
                                          tittle: "Корзина",
                                          image: UIImage(systemName: "basket.fill")
        )
        viewControllers = [
            menuViewController,
            contactViewController,
            profileViewController,
            basketViewController
        ]
    }

    private func createVC(viewController: UIViewController, tittle: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = tittle
        viewController.tabBarItem.image = image
        return UINavigationController(rootViewController: viewController)
    }
}
