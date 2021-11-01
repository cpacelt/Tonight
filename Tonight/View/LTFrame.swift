//
//  ContentAppUIPlan.swift
//  Tonight
//
//  Created by Роман Путинцев on 10.10.2021.
//

import UIKit

// MARK: LTScreen incapsulate preferences needed to apply to ViewController
final class LTScreen {
    let vc: UIViewController
    let isInNav: Bool?
    let tabBarItem: UITabBarItem?

    init(_ vc: UIViewController, inNav isInNav: Bool? = false, _ tabBarItem: UITabBarItem? = nil) {
        self.vc = vc
        self.isInNav = isInNav
        self.tabBarItem = tabBarItem
    }
}

// MARK: LTFrame
// class wrap ViewControllers, its properties and global UI propertyes (global tint color for example)
// and pass it to LTBuilder for building and setup
//

final class LTFrame {
    let items: [LTScreen]?
    var tintColor: UIColor?
    var backgroundColor: UIColor?
    var foregroundColor: UIColor?
    
    init(_ screens: [LTScreen]? = nil) {
        self.items = screens
    }
}

// MARK: Extension of LTFrame which stored Tonight.app frame
extension LTFrame {
    static var tonightFrame: LTFrame? = {
        
        let frame = LTFrame([ LTScreen( BestViewController(), inNav: true, .best),
                              LTScreen( CompilationsViewController(), inNav: true, .films),
                              LTScreen( SearchViewController(), inNav: true, .search),
                              LTScreen( AccountViewController(), inNav: true, .account) ])
        frame.tintColor = UIColor(red: 1 / 255, green: 180 / 255, blue: 228 / 255, alpha: 1)
        
        
        return frame
    }()
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
