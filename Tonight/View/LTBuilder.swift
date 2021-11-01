//
//  ContentAppUIBuilder.swift
//  Tonight
//
//  Created by Роман Путинцев on 09.10.2021.
//

import UIKit

// MARK: LTBuilder
// Class to build default application UI with UITabBarController and UINavigationController or its
// inheritors.
//
// Array of ViewControllers and its preferences passes to builder in wrapper instance. Wrapper name is LTFrame.
// Builder should place in AppDelegate or SceneDelegate.
// For ex:
//         let frame = LTFrame.tonightFrame
//         LTBuilder<UITabBarController, UINavigationController>(with: frame!, on: self.window)

 
// For ex:
//
//  extension LTFrame {
//      static var tonightFrame: LTFrame? = {
//
//            let frame = LTFrame([ LTScreen( BestViewController(), inNav: true, .best),
//                                  LTScreen( CompilationsViewController(), inNav: true, .films),
//                                  LTScreen( SearchViewController(), inNav: true, .search),
//                                  LTScreen( AccountViewController(), inNav: true, .account) ])
//          frame.tintColor = UIColor(red: 1 / 255, green: 180 / 255, blue: 228 / 255, alpha: 1)
//
//          return frame
//      }()
//  }

final class LTBuilder<TB: UITabBarController, NC: UINavigationController> {
    
    let window: UIWindow?
    private(set) var mainTabBarController: TB
    private let frame: LTFrame?
    private(set) var viewControllersToTabBar = [UIViewController]()
    

    init(with frame: LTFrame, on window: UIWindow?) {
        
        self.window = window
        self.mainTabBarController = TB()
        self.frame = frame

        // WARNING: Avoid change the direction of calling this functions, if you need setup ViewControllers
        // do it in vcsDidBuiltedInTabBar() and vcsDidBuiltedInNavigations() functions.
        //
        // Changing of calling direction can break building process
        self.initialWindowSetup()
        self.initialVCsSetup()
        self.buildVCsInNavigations()
        self.buildVCsInTabBar()
        self.window?.rootViewController = self.mainTabBarController
        
    }
    
    private func initialWindowSetup(){
        self.window?.tintColor = self.frame?.tintColor
        
        // To setup global UI properties put your code here...
        //
        // ...
    }
    
    private func initialVCsSetup() {
        // This function calling before builting ViewControllers in navigation and tabbar
        guard let frame = self.frame else { return }
        guard let screens = frame.items else { return }
        
        for screen in screens {
            screen.vc.tabBarItem = screen.tabBarItem
         }
    }
    
    private func vcsDidBuiltedInNavigations() {
        // This function calling after builting ViewControllers in navigation and you can
        // use navigationBar property here

    }
    
    private func vcsDidBuiltedInTabBar() {
        // This function calling after building ViewControllers hierarchy,
        // all view controllers may have .tabBarItem and .navigationController properties
        // To finish setup properties put your code here...
        //
        // ...
    }
    
    private func buildVCsInNavigations() {
        guard let frame = self.frame else { return }
        guard let screens = frame.items else { return }
        
        for screen in screens {
            guard let isNeedToEmbed = screen.isInNav else { return }
            if isNeedToEmbed {
                let navigationControllerWithVC = NC(rootViewController: screen.vc)
                 viewControllersToTabBar.append(navigationControllerWithVC)
             } else {
                 viewControllersToTabBar.append(screen.vc)
             }
         }
        
        self.vcsDidBuiltedInNavigations()
    }
    
    private func buildVCsInTabBar() {
        self.mainTabBarController.viewControllers = viewControllersToTabBar
        self.vcsDidBuiltedInTabBar()
     }
    
    deinit {
        // Delete last shared reference to free memory
        LTFrame.tonightFrame = nil
    }
}
