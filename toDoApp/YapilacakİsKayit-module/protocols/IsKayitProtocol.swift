//
//  IsKayitProtocol.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
//ana protocol
protocol ViewToPresenterIsKayitProtocol {
   var isKayitInteractor:PresenterToInteractorIsKayitPortocol? { get set}
    
    func ekle (yapilacak_is: String)
}
protocol PresenterToInteractorIsKayitPortocol {
    func yapilacakEkle (yapilacak_is: String)
    
}
//router
protocol PresenterToRouterIsKayitProtocol {
    static func createModule(ref:IsKayitVC)
    
}
