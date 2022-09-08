//
//  IsKayitProtocol.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
protocol ViewToPresenterIsDetayProtocol {
    var isDetayInteractor: PresenterToInteractorIsDetayProtocol? { get set }
    
    func guncelle(yapilacak_id: Int, yapilacak_is:String)
}
protocol PresenterToInteractorIsDetayProtocol {
    func yapilacakGuncelle(yapilacak_id: Int, yapilacak_is:String)
    
}
//router
protocol PresenterToRouterIsDetayProtocol {
    static func createModule(ref: IsDetayVC)
}
