//
//  IsKayitPresenter.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsKayitPresenter : ViewToPresenterIsKayitProtocol{
    var isKayitInteractor: PresenterToInteractorIsKayitPortocol?
    
    func ekle(yapilacak_is: String) {
        isKayitInteractor?.yapilacakEkle(yapilacak_is: yapilacak_is)
    }
}
