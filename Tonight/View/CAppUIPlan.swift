//
//  ContentAppUIPlan.swift
//  Tonight
//
//  Created by Роман Путинцев on 10.10.2021.
//

import UIKit

// MARK: ContentAppVCPreferences incapsulate preferences needed to apply to ViewControllers
// Important ability
// let isEmbeddedInNavigation: Bool to say ContentAppUIBuilder that you want to builtin ViewController in navigation
// let tabBarItem: UITabBarItem to say ContentAppUIBuilder what item you want use for ViewController in TabBar
//
//
// Example:
//  let preferences = ContentAppVCPreferences(isEmbeddedInNavigation: true, .best, true)
//  let plan = ContentAppUIPlan(forControllersWithPreferences:[
//    (AccountViewController(), preferences)
//  ])
//
//  ContentAppUIBuilder<UITabBarController, UINavigationController>(with: plan, on: self.window)
//

final class CAppVCPreferences {
    let isEmbeddedInNavigation: Bool?
    let tabBarItem: UITabBarItem?
    let preferLargeTitles: Bool?
    
    init(isEmbeddedInNavigation embedInNavigation: Bool? = false, _ tabBarItem: UITabBarItem? = nil, _ preferLargeTitles: Bool? = true) {
        self.isEmbeddedInNavigation = embedInNavigation
        self.tabBarItem = tabBarItem
        self.preferLargeTitles = preferLargeTitles
    }
}


// MARK: Extension of UITabBarItem which stored Tonight.app UITabBarItems
extension UITabBarItem {
    
    static let mediumConfiguration = UIImage.SymbolConfiguration(weight: .bold)
    
    static let best = {
        return UITabBarItem(title: "Лучшее", image: UIImage(systemName: "heart.text.square", withConfiguration: mediumConfiguration), selectedImage: UIImage(systemName: "heart.text.square.fill"))
    }()
    
    static let account = {
        return UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle", withConfiguration: mediumConfiguration), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
    }()
    
    static let films = {
        return UITabBarItem(title: "Подборки", image: UIImage(systemName: "film", withConfiguration: mediumConfiguration), selectedImage: UIImage(systemName: "film.fill"))
    }()
    
    static let search = {
        return UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass", withConfiguration: mediumConfiguration), selectedImage: UIImage(systemName: "magnifyingglass"))
    }()
}

// MARK: ContentAppUIPlan
// class wrap ViewControllers, its properties and global UI propertyes (global tint color for example)
// and pass it to ContentAppUIBuilder for building and setup
//

final class CAppUIPlan {
    
    let globalTintColor: UIColor?
    
    let items: [(viewController: UIViewController, preferences: CAppVCPreferences)]?
    
    init(forControllersWithPreferences viewControllers: [(viewController: UIViewController, preferences: CAppVCPreferences)]? = nil, globalTintColor color: UIColor? = nil) {
        self.items = viewControllers
        self.globalTintColor = color
    }
    
}

// MARK: Extension of ContentAppUIPlan which stored Tonight.app bulding plan
extension CAppUIPlan {
    static var tonightAppPlan: CAppUIPlan? = CAppUIPlan(forControllersWithPreferences: [
        (BestViewController(), CAppVCPreferences(isEmbeddedInNavigation: true, .best, true)),
        (CompilationsViewController(), CAppVCPreferences(isEmbeddedInNavigation: true, .films, true)),
        (SearchViewController(), CAppVCPreferences(isEmbeddedInNavigation: true, .search, true)),
        (AccountViewController(), CAppVCPreferences(isEmbeddedInNavigation: true, .account, true))
    ],
    globalTintColor: UIColor(red: 1 / 255, green: 180 / 255, blue: 228 / 255, alpha: 1))
}
