//
//  AnasayfaProtocol.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set }
    var anasayfaView: PresenterToViewAnasayfaProtocol?{get set }
    
    func yapilacaklariYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilacak_id: Int)
    
}
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?{get set }
    
    func tumYapilacaklariAl()
    func yapilacakAra(aramaKelimesi: String)
    func yapilacakSil(yapilacak_id: Int)
}
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder (yapilacaklarListesi: Array<Yapilacaklar>)
}
protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder (yapilacaklarListesi: Array<Yapilacaklar>)
}
protocol PresenterToRounterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
    
}
