//
//  UIWindow+Setup.swift
//  DBZ-App
//
//  Created by Jhonatan Chavez on 23/11/24.
//
import UIKit

extension UIWindow{
    static func configInitialWindow(for windowScene: UIWindowScene? = nil) -> UIWindow{
        var window: UIWindow
        if let scene = windowScene {
            window = UIWindow(windowScene: scene)
        }else{
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        //let rootVC = ViewController(nibName: "MainVC", bundle: nil)
        let rootVC = MainVC.loadFromNib()
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
}
