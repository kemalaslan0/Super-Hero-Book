//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Kemal Aslan on 29.04.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //delegate ve veri kaynağımda viewcontroller 10 tane row oluşturacak onlarda da test yazacak
        tableView.dataSource = self
        superKahramanIsimleri.append("Spider-Man")
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Hulk")
        superKahramanIsimleri.append("Iron-Man")
        superKahramanIsimleri.append("Captain Amerika")
        
        superKahramanGorselIsimleri.append("spiderman")
        superKahramanGorselIsimleri.append("batman")
        superKahramanGorselIsimleri.append("hulk")
        superKahramanGorselIsimleri.append("ironman")
        superKahramanGorselIsimleri.append("captainamerica")

    }
    //Bu fonksiyonları çağırmak için uitableviewdelegate ui yönetimini eklememiz gerek
    //Ayrıca uıtableviewdatasource veri kaynağı kısmını eklememız lazım
    //numberOfRowsInSection -> kaç tane row olacak
    //cellForRow atIndexPath -> satırlarda ne olcak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    //-> Int kısmına kaç tane satır olacağını yazmamız lazım code kısmına return 10 yazarsak 10 satırlık olur
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=superKahramanIsimleri[indexPath.row] //indexpath.row dizideki index mantığında 0 dan başlayıp artarak gidiyor
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superKahramanIsimleri.remove(at: indexPath.row)
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
         secilenIsim = superKahramanIsimleri[indexPath.row]
         secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmi = secilenGorsel
        }
    }
    
}

