//
//  IsDetayPresenter.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsDetayPresenter : ViewToPresenterIsDetayProtocol{
    
    var isDetayInteractor: PresenterToInteractorIsDetayProtocol?
    
    func guncelle(yapilacak_id:Int, yapilacak_is:String) {
        
        isDetayInteractor?.yapilacakGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
