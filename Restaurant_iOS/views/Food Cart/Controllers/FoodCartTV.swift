//
//  FoodCartTV.swift
//  Restaurant_iOS
//
//  Created by azab on 10/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class FoodCartTV: UITableViewController {

    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Your Food Cart"
        
        addViewGradientColor()
//        addGradientColor()
        tableView.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "cartCell")

    }
    
    @IBAction func checkout(_ sender: Any) {
        
        let checkout = self.storyboard?.instantiateViewController(withIdentifier: "checkout") as? CheckoutVC
        navigationController?.pushViewController(checkout!, animated: true)
    }
    
    
//    // MARK: addGradientColorToCollectionView
//    func addGradientColor() {
//
//        let tableViewBackgroundView = UIView()
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame.size = view.frame.size
//        // Start and end for left to right gradient
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
//        gradientLayer.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
//        tableView.backgroundView = tableViewBackgroundView
//        tableView.backgroundView?.layer.addSublayer(gradientLayer)
//    }
    
    func gradient(frame:CGRect) -> CAGradientLayer {
           let layer = CAGradientLayer()
           layer.frame = frame
           layer.startPoint = CGPoint(x: 0, y: 0.5)
           layer.endPoint = CGPoint(x: 1, y: 0.5)
           layer.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
           
           return layer
       }
    
    func addViewGradientColor() {
        footerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let gradient = CAGradientLayer()
        gradient.frame = footerView.bounds
        gradient.colors = [UIColor(red:250/255, green:242/255, blue:242/255, alpha: 0.5).cgColor, UIColor(red:250/255, green:226/255, blue:266/255, alpha: 0.75).cgColor, UIColor(red:250/255, green:242/255, blue:242/255, alpha: 1.0).cgColor]
        
        footerView.layer.insertSublayer(gradient, at: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTVCell

//        cell.layer.insertSublayer(gradient(frame: cell.bounds), at:1)

        // Configure the cell...

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
