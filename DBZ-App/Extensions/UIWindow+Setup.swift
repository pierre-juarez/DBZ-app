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
        
        let rootVC = ViewController(nibName: "MainVC", bundle: nil)
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        return window
    }
}
