//
//  Constants.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import CoreData

struct GlobalSize {
    static let ImageSizeForLargeState: CGFloat = 40
    static let ImageRightMargin: CGFloat = 16
    static let ImageBottomMarginForLargeState: CGFloat = 8
    static let ImageBottomMarginForSmallState: CGFloat = 6
    static let ImageSizeForSmallState: CGFloat = 32
    static let NavBarHeightSmallState: CGFloat = 44
    static let NavBarHeightLargeState: CGFloat = 96.5
}

struct GlobalStyle {
    static let BackgroundColor: UIColor = UIColor.systemGray6
    static let CardBackgroundColor: UIColor = .white
    static let TouchElementColor: UIColor = #colorLiteral(red: 0.4470588235, green: 0.7568627451, blue: 0.6784313725, alpha: 1)
    static let WarningColor: UIColor = #colorLiteral(red: 1, green: 0.568627451, blue: 0.5450980392, alpha: 1)

    static let comparableDateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy/MM/dd"

        return dateFormat
    }()

    static let dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"

        return dateFormat
    }()
}

let coreDataContext: NSManagedObjectContext = {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
       fatalError("")
    }

    let context = appDelegate.persistentContainer.viewContext

    return context
}()
