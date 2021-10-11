//
//  ViewController.swift
//  Tonight
//
//  Created by Роман Путинцев on 09.10.2021.
//

import UIKit

class ContentAppViewController<T: UIView>: UIViewController {
    
    var backgroundScrollView = UIScrollView()
    var mainView = T()
    var initialContentOffset = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.tabBarItem.title
        self.view.backgroundColor = .systemBackground
        
        self.backgroundScrollView = UIScrollView()
        self.mainView = T()
        
        self.view.addSubview(backgroundScrollView)
        self.backgroundScrollView.addSubview(mainView)
        
        
        // MARK: WARNING! If delete this line scroll view spop scrolling. WTF?
        backgroundScrollView.backgroundColor = .systemBackground
        backgroundScrollView.showsVerticalScrollIndicator = false
        //
    
        layoutViews()
        
        backgroundScrollView.contentSize.height = view.bounds.height + 1
        
    }
    
    private func layoutViews() {
        self.backgroundScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        initialContentOffset = backgroundScrollView.contentOffset
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (backgroundScrollView.contentOffset.y > initialContentOffset.y) && (backgroundScrollView.contentOffset.y < initialContentOffset.y + (navigationController?.navigationBar.bounds.height)!){
            backgroundScrollView.setContentOffset(initialContentOffset, animated: false)
        }
    }
    
}

