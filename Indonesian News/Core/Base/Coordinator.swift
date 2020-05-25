//
//  BaseCoordinator.swift
//  Indonesian News
//
//  Created by yoviekaputra on 25/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
