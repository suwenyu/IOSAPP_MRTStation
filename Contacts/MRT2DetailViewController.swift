//
//  MRTDitailViewController.swift
//  Contacts
//
//  Created by WenYu on 2016/5/7.
//  Copyright © 2016年 TsungYen Su. All rights reserved.
//

import UIKit

class MRT2DitailViewController: UIViewController {
    
    @IBOutlet weak var MRTStationNameLabel: UILabel!
    @IBOutlet weak var LineNameLabel: UILabel!
    @IBOutlet weak var Line1NameLable: UILabel!
    @IBOutlet weak var Line2NameLable: UILabel!
    
    var mrtstation:Contact?{
        didSet {
            self.updateValues()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateValues()
    }
    func updateValues() {
        guard self.isViewLoaded() else {
            return
        }
        print("Hello Detail2")
        
        self.MRTStationNameLabel.text = mrtstation?.name
            for (index, (i , j)) in (mrtstation?.lines!.enumerate())!{
                if (index == 0){
                    self.Line1NameLable.text = i
                    if i == "文湖線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (158/255.0), green: (101/255.0), blue: (46/255.0), alpha: 1.0)
                    }
                    else if i == "淡水信義線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (203/255.0), green: (44/255.0), blue: (48/255.0), alpha: 1.0)
                    }
                    else if i == "新北投支線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (248/255.0), green: (144/255.0), blue: (165/255.0), alpha: 1.0)
                    }
                    else if i == "松山新店線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (0/255.0), green: (119/255.0), blue: (73/255.0), alpha: 1.0)
                    }
                    else if i == "小碧潭支線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (206/255.0), green: (220/255.0), blue: (0/255.0), alpha: 1.0)
                    }
                    else if i == "中和新蘆線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (255/255.0), green: (163/255.0), blue: (0/255.0), alpha: 1.0)
                    }
                    else if i == "板南線"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (0/255.0), green: (94/255.0), blue: (184/255.0), alpha: 1.0)
                    }
                    else if i == "貓空纜車"{
                        self.Line1NameLable.backgroundColor = UIColor(red: (119/255.0), green: (185/255.0), blue: (51/255.0), alpha: 1.0)
                    }
                    
                }
                else{
                    self.Line2NameLable.text = i
                    if i == "文湖線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (158/255.0), green: (101/255.0), blue: (46/255.0), alpha: 1.0)
                    }
                    else if i == "淡水信義線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (203/255.0), green: (44/255.0), blue: (48/255.0), alpha: 1.0)
                    }
                    else if i == "新北投支線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (248/255.0), green: (144/255.0), blue: (165/255.0), alpha: 1.0)
                    }
                    else if i == "松山新店線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (0/255.0), green: (119/255.0), blue: (73/255.0), alpha: 1.0)
                    }
                    else if i == "小碧潭支線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (206/255.0), green: (220/255.0), blue: (0/255.0), alpha: 1.0)
                    }
                    else if i == "中和新蘆線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (255/255.0), green: (163/255.0), blue: (0/255.0), alpha: 1.0)
                    }
                    else if i == "板南線"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (0/255.0), green: (94/255.0), blue: (184/255.0), alpha: 1.0)
                    }
                    else if i == "貓空纜車"{
                        self.Line2NameLable.backgroundColor = UIColor(red: (119/255.0), green: (185/255.0), blue: (51/255.0), alpha: 1.0)
                    }
                    
                }
            }
        }
    
}

