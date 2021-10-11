//
//  ContentAppUIBuilder.swift
//  Tonight
//
//  Created by Роман Путинцев on 09.10.2021.
//

import UIKit


// MARK: ContentAppUIBuilder
/* Class to build default application UI with UITabBarController and UINavigationController or its
 inheritors.
    Array of UIViewControllers or its inheritors, to built in UI, passes in wrapper named NeedsNavigationFor.
 Builder should place in AppDelegate or SceneDelegate.
 
 For example:
 
 var viewControllersToBuiltIn = [
     NeedsNavigationFor(UIViewController(), true),
     NeedsNavigationFor(MyViewController(), true),
     NeedsNavigationFor(ViewController(), true)
 ]
 
 ContentAppUIBuilder<UITabBarController, UINavigationController>(built: viewControllersToBuiltIn, on: self.window)

 
 */

final class ContentAppUIBuilder<TB: UITabBarController, NC: UINavigationController> {
    
    let window: UIWindow?
    private(set) var mainTabBarController: TB
    //private let viewControllersWithBool: [NeedsNavigationFor]
    private let plan: ContentAppUIPlan?
    private(set) var viewControllersToTabBar = [UIViewController]()
    

    init(with plan: ContentAppUIPlan, on window: UIWindow?) {
        
        self.window = window
        self.mainTabBarController = TB()
        self.plan = plan

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
        self.window?.tintColor = self.plan?.globalTintColor
        
        // To setup global UI properties put your code here...
        //
        // ...
    }
    
    private func initialVCsSetup() {
        // This function calling before builting ViewControllers in navigation and tabbar
        guard let plan = self.plan else { return }
        guard let planItems = plan.items else { return }
        
        for planItem in planItems {
            planItem.viewController.tabBarItem = planItem.preferences.tabBarItem
         }
        
        
    }
    
    private func vcsDidBuiltedInNavigations() {
        // This function calling after builting ViewControllers in navigation and you can
        // use navigationBar property here
        
        guard let plan = self.plan else { return }
        guard let planItems = plan.items else { return }
        
        for planItem in planItems {
            planItem.viewController.navigationController?.navigationBar.prefersLargeTitles = planItem.preferences.preferLargeTitles ?? false
         }
        
    }
    
    private func vcsDidBuiltedInTabBar() {
        // This function calling after building ViewControllers hierarchy,
        // all view controllers may have .tabBarItem and .navigationController properties
        // To finish setup properties put your code here...
        //
        // ...
    }
    
    private func buildVCsInNavigations() {
        guard let plan = self.plan else { return }
        guard let planItems = plan.items else { return }
        
        for planItem in planItems {
            guard let isNeedToEmbed = planItem.preferences.isEmbeddedInNavigation else { return }
            if isNeedToEmbed {
                let navigationControllerWithVC = NC(rootViewController: planItem.viewController)
                 viewControllersToTabBar.append(navigationControllerWithVC)
             } else {
                 viewControllersToTabBar.append(planItem.viewController)
             }
         }
        
        self.vcsDidBuiltedInNavigations()
    }
    
    private func buildVCsInTabBar() {
        self.mainTabBarController.viewControllers = viewControllersToTabBar
        self.vcsDidBuiltedInTabBar()
     }
    
}
