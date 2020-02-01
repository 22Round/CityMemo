//
//  NSManagedObjectContext.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 2/1/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObjectContext {
    static var current:NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }
}
