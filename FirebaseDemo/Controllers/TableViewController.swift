//
//  TableViewController.swift
//  FirebaseDemo
//
//  Created by Xcode User on 2018-03-24.
//  Copyright © 2018 Austin Howlett. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct appointmentStruct {
    let name : String!
    let apptType : String!
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var appointments : [appointmentStruct] = []
    var dbHandle : DatabaseHandle?
    @IBOutlet var appointmentTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeAppointment()
        let databaseRef : DatabaseReference
        databaseRef = Database.database().reference()
        dbHandle = databaseRef.child("Appointments").queryOrderedByKey().observe(.childAdded) { (snapshot) in
            
            let valueApp = snapshot.value as? [String : String]
            let name : String! = valueApp!["name"]
            print("Name: \(name)")
            let apptType : String! = valueApp!["apptType"]
            print("Type: \(apptType)")
            
            self.appointments.insert(appointmentStruct(name: name, apptType: apptType), at: 0)
            self.appointmentTableView.reloadData()
        }
    }

    func makeAppointment() {
        let name : String = "Hair Appointment"
        let apptType : String = "Hair"
//        let start_time : Date
//        let end_time : Date
//        let price : Double
//        let price_per_hour : Double?
//        let location : String
        
        let appointment : [String : String] = ["name": name, "apptType": apptType]
        
        let databaseRef : DatabaseReference
        databaseRef = Database.database().reference()
        databaseRef.child("Appointments").childByAutoId().setValue(appointment)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appointmentTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = appointments[indexPath.row].name
        
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text = appointments[indexPath.row].apptType
        
        return cell!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
