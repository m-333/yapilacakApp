//
//  ViewController.swift
//  toDoApp
//
//  Created by melek türüdi on 8.09.2022.
//

import UIKit

class AnasayfaVC: UIViewController {
   
    @IBOutlet weak var yapilacakTableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var yapilacaklarListe = [Yapilacaklar] ()
    var anasayfaPresenterNesnesi: ViewToPresenterAnasayfaProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        yapilacakTableview.delegate = self
        yapilacakTableview.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        veritabaniKopyala()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yapilacaklariYukle()
        //anasayfaya döndüğünde sayfamıza tim kişileri getirecek
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yapilacak = sender as? Yapilacaklar{
                let gidilecekVC = segue.destination as! IsDetayVC
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }
    func veritabaniKopyala (){
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("veritabanı zaten var")
        }else {
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yapilacaklarListesi: Array<Yapilacaklar>) {
        self.yapilacaklarListe = yapilacaklarListesi
        self.yapilacakTableview.reloadData()
    }
}
extension AnasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       // anasayfaPresenterNesnesi?.ara(araamKelimesi: searchText)
    }
}
extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = yapilacaklarListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre", for: indexPath) as! TableViewHucre
        hucre.yapilacakLabel.text = "\(yapilacak.yapilacak_is!)"
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListe[indexPath.row]
        print( "\(yapilacak.yapilacak_is!) secildi")
        performSegue(withIdentifier:"toDetay" , sender:  yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "sil"){
            (contextualAction, view, Bool) in
            let yapilacak = self.yapilacaklarListe[indexPath.row]

            
            let alert = UIAlertController(title: "silme işlemi", message: "\(yapilacak.yapilacak_is!) silinsin mi ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "iptal ", style: .cancel){action in }
            let evetAction = UIAlertAction(title: "evet", style: .destructive){
                action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacak.yapilacak_id!)
            }
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
    }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
