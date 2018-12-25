//
//  QNNTheme.swift
//  QNN
//
//  Created by joewang on 2018/11/9.
//  Copyright © 2018 qianshengqian. All rights reserved.
//


import UIKit

enum QNNTheme: Int {
    
    case `default`, dark, graphical
    
    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: QNNTheme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return QNNTheme(rawValue: storedTheme) ?? .default
    }
    
    var mainColor: UIColor {
        switch self {
        case .default:
            return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        case .dark:
            return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        case .graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .default, .graphical:
            return .default
        case .dark:
            return .black
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.white
        case .dark:
            return UIColor(white: 0.4, alpha: 1.0)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .default, .graphical:
            return UIColor.black
        case .dark:
            return UIColor.white
        }
    }
    
    var navigationBackgroundImage: UIImage? {
        return self == .graphical ? UIImage(named: "navBackground") : nil
    }
    
    var tabBarBackgroundImage: UIImage? {
        return self == .graphical ? UIImage(named: "tabBarBackground") : nil
    }
    
    func apply() {
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
        
        UIApplication.shared.delegate?.window??.tintColor = mainColor
        customNavigationBar()
        customTabbar()
        customTableviewCell()
    }
    
    func customNavigationBar() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barStyle = barStyle
        navBarAppearance.setBackgroundImage(navigationBackgroundImage, for: .default)
        navBarAppearance.backIndicatorImage = UIImage(named: "backArrow")
        navBarAppearance.backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
    }
    
    func customTabbar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barStyle = barStyle
        tabBarAppearance.backgroundImage = tabBarBackgroundImage
        
        let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
        let tabResizableIndicator = tabIndicator?.resizableImage(
            withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
        tabBarAppearance.selectionIndicatorImage = tabResizableIndicator
    }
    
    
    func customTableviewCell() {
        UITableViewCell.appearance().backgroundColor = backgroundColor
        if #available(iOS 9.0, *) {
            UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).textColor = textColor
        } else {
            // Fallback on earlier versions
        }
    }
}
