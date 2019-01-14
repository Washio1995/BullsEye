//
//  ScoresViewController.swift
//  ios-app
//
//  Created by PRADOPC on 12/18/18.
//  Copyright © 2018 PRADOPC. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var ScoresTable: UITableView!
    var ref: DatabaseReference!
    var games:[[String:AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }
    override func viewWillAppear(_ animated: Bool) {
        getFirebaseInfo()
    }
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func getFirebaseInfo() {
        let weatherRef = ref.child("games")
        weatherRef.observe(.childAdded) { (dataSnapshot) in
            
            var gameDict = dataSnapshot.value as? [String:AnyObject] ?? [:]
            print(gameDict)
            gameDict["id"] = dataSnapshot.key as AnyObject
            self.games += [gameDict]
            print("Actualizando datos...")
            self.ScoresTable.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as! ScoreTableViewCell
        cell.nameLabel.text = self.games[indexPath.row]["player"] as? String
        cell.scoreLabel.text = String(self.games[indexPath.row]["score"] as! Int)
        print(self.games[indexPath.row]["score"] ?? 666)
        cell.idLabel.text = self.games[indexPath.row]["id"] as? String
        // let cell = UITableViewCell()
        // let cityName = weathers[indexPath.row]["city"] ?? "city"
        // let weatherCity = weathers[indexPath.row]["weather"] ?? "weather"
        // cell.textLabel?.text = "\(cityName) - \(weatherCity)"
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
