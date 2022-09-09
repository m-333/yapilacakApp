//
//  IsKayitRouter.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsKayitRouter: PresenterToRouterIsKayitProtocol {
    static func createModule(ref: IsKayitVC) {
        ref.isKayitPresenterNesnesi = IsKayitPresenter()
        ref.isKayitPresenterNesnesi?.isKayitInteractor = IsKayitInteractor()
    }
}

