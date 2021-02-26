//
//  NavBarHelper.swift
//  CoreDataPractice
//
//  Created by David on 2/26/21.
//

import UIKit

class NavBarHelper{
    static func changeNavBarAppearance(){
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setBackgroundImage(UIImage(systemName: "list.bullet.indent"), for: .normal, barMetrics: .default)
        let navAppearance = UINavigationBar.appearance()
        let emptyImage = UIImage()
        navAppearance.backIndicatorImage = emptyImage
        navAppearance.backIndicatorTransitionMaskImage = emptyImage
        navAppearance.barTintColor = UIColor(patternImage: UIImage(named: "mountain")!)
    }
}
