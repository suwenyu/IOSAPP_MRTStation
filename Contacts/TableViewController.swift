//
//  TableViewController.swift
//  Contacts
//
//  Created by WenYu on 2016/5/6.
//  Copyright © 2016年 TsungYen Su. All rights reserved.
//

import UIKit
import ObjectMapper

struct Contact {
    var name: String!
    var coordinate: [Float]!
    var lines: Dictionary<String ,String>!
    
}
extension Contact: Mappable {
    init? (_ map: Map) {
        
    }
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.coordinate <- map["coordinate"]
        self.lines <- map["lines"]
    }
}

struct Station {
    var linename:String!
    var statename:[Contact]!
}



struct StationSource{
    var stations : [Station] = []
    
    init(mrtcontact:[Contact]){
        
        var stationmap = [String : [Contact]]()
        
        for i in mrtcontact{
            var linearray:[String] = []
            
            for (a,b) in i.lines{
                if stationmap[a] == nil{
                    stationmap[a] = []
                }
                stationmap[a]!.append(i)
            }
        }
        
        for (i , j) in stationmap{
            let station = Station(linename: i , statename: j)
            stations.append(station)
        }
        
    }
}


class TableViewController: UITableViewController {

    var MRTcontact :[Contact] = []
    var MRTstation :[Station] = []
    
    var MRTStationSource : StationSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("MRT", ofType: "json")!
            
        let jsonContent = try! String(contentsOfFile: path)
        
            //        NSLog(jsonContent)
            
            
        self.MRTcontact = Mapper<Contact>().mapArray(jsonContent)!
        let stationsource = try? StationSource(mrtcontact:MRTcontact)
        
        
        self.MRTStationSource = stationsource

        
        
        
//        print (MRTstation[1])
//        print(MRTcontact[1])
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        print (self.MRTcontact.count)
        return self.MRTStationSource.stations.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.MRTStationSource.stations[section].statename.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let stationdata = self.MRTStationSource.stations[indexPath.section].statename[indexPath.row]
        
        var cellIdentifier = ""
        
        if stationdata.lines.count == 1{
            cellIdentifier = "Cell"
        }
        else{
            cellIdentifier = "Cell2"
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        

        
        cell.textLabel?.text = stationdata.name
        cell.line1Label?.text = nil
        cell.line2Label?.text = nil
        cell.line1Label.backgroundColor = nil
        cell.line2Label.backgroundColor = nil
        
        for (index ,(i , j)) in stationdata.lines.enumerate(){
            
            if index == 0{
                cell.line1Label?.text = j
                if i == "文湖線"{
                    cell.line1Label.backgroundColor = UIColor(red: (158/255.0), green: (101/255.0), blue: (46/255.0), alpha: 1.0)
                }
                else if i == "淡水信義線"{
                    cell.line1Label.backgroundColor = UIColor(red: (203/255.0), green: (44/255.0), blue: (48/255.0), alpha: 1.0)
                }
                else if i == "新北投支線"{
                    cell.line1Label.backgroundColor = UIColor(red: (248/255.0), green: (144/255.0), blue: (165/255.0), alpha: 1.0)
                }
                else if i == "松山新店線"{
                    cell.line1Label.backgroundColor = UIColor(red: (0/255.0), green: (119/255.0), blue: (73/255.0), alpha: 1.0)
                }
                else if i == "小碧潭支線"{
                    cell.line1Label.backgroundColor = UIColor(red: (206/255.0), green: (220/255.0), blue: (0/255.0), alpha: 1.0)
                }
                else if i == "中和新蘆線"{
                    cell.line1Label.backgroundColor = UIColor(red: (255/255.0), green: (163/255.0), blue: (0/255.0), alpha: 1.0)
                }
                else if i == "板南線"{
                    cell.line1Label.backgroundColor = UIColor(red: (0/255.0), green: (94/255.0), blue: (184/255.0), alpha: 1.0)
                }
                else if i == "貓空纜車"{
                    cell.line1Label.backgroundColor = UIColor(red: (119/255.0), green: (185/255.0), blue: (51/255.0), alpha: 1.0)
                }
                

            }
            if index == 1{
                cell.line2Label?.text = j
                if i == "文湖線"{
                    cell.line2Label.backgroundColor = UIColor(red: (158/255.0), green: (101/255.0), blue: (46/255.0), alpha: 1.0)
                }
                else if i == "淡水信義線"{
                    cell.line2Label.backgroundColor = UIColor(red: (203/255.0), green: (44/255.0), blue: (48/255.0), alpha: 1.0)
                }
                else if i == "新北投支線"{
                    cell.line2Label.backgroundColor = UIColor(red: (248/255.0), green: (144/255.0), blue: (165/255.0), alpha: 1.0)
                }
                else if i == "松山新店線"{
                    cell.line2Label.backgroundColor = UIColor(red: (0/255.0), green: (119/255.0), blue: (73/255.0), alpha: 1.0)
                }
                else if i == "小碧潭支線"{
                    cell.line2Label.backgroundColor = UIColor(red: (206/255.0), green: (220/255.0), blue: (0/255.0), alpha: 1.0)
                }
                else if i == "中和新蘆線"{
                    cell.line2Label.backgroundColor = UIColor(red: (255/255.0), green: (163/255.0), blue: (0/255.0), alpha: 1.0)
                }
                else if i == "板南線"{
                    cell.line2Label.backgroundColor = UIColor(red: (0/255.0), green: (94/255.0), blue: (184/255.0), alpha: 1.0)
                }
                else if i == "貓空纜車"{
                    cell.line2Label.backgroundColor = UIColor(red: (119/255.0), green: (185/255.0), blue: (51/255.0), alpha: 1.0)
                }
                

            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.MRTStationSource.stations[section].linename
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var segueIdentifier = ""

        guard let cell = sender as? UITableViewCell else { return }

        let indexPath = self.tableView.indexPathForCell(cell)!
        let mrtstation = self.MRTStationSource.stations[indexPath.section].statename[indexPath.row]
        if (mrtstation.lines.count == 2){
            segueIdentifier = "ShowOtherDetail"
        }
        else{
            segueIdentifier = "ShowDetail"
        }
        
        
        if segueIdentifier == "ShowDetail" {
            guard let detailViewController = segue.destinationViewController as? MRTDitailViewController else {
                return
            }
            detailViewController.mrtstation = mrtstation

            }
        else{
            guard let detailViewController = segue.destinationViewController as? MRT2DitailViewController else {
                return
            }
            detailViewController.mrtstation = mrtstation
        }
    }

}



