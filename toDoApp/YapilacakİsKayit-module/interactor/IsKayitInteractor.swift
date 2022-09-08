//
//  IsKayitInteractor.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
class IsDetayInteractor : PresenterToInteractorIsDetayProtocol {
    let db:FMDatabase?
    
    init (){
   let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
   let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func yapilacakGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE kisiler SET yapilacak_is = ? WHERE yapilacak_id = ? ", values: [yapilacak_is,yapilacak_id])
        } catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
