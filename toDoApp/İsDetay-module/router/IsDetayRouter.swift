//
//  IsDetayRouter.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsDetayRouter : PresenterToRouterIsDetayProtocol{
    static func createModule(ref: IsDetayVC) {
        ref.isDetayPresenterNesnesi = IsDetayPresenter()
        
        ref.isDetayPresenterNesnesi?.isDetayInteractor = IsDetayInteractor()
    }
}
