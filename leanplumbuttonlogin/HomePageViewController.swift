//
//  HomePageViewController.swift
//  leanplumbuttonlogin
//
//  Created by MBC on 1/12/18.
//  Copyright © 2018 MBC. All rights reserved.
//

import UIKit
import Leanplum

var colorsArray = ["Grey", "Blue", "Green", "Yellow", "Brown", "Cyan", "Magenta", "Red", "Purple", "White"]


class HomePageViewController: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!
    
    var labelValue: String?
    var buttonPresses: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = "Tap button to change color"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOut(_ sender: Any) {
    }
    
    @IBAction func loadColor(_ sender: Any) {
        print("loadColor")

        //Label text will equal the funFactArray position using the incremented variable value
        colorLabel.text = colorsArray[buttonPresses]
        Leanplum.track("loadColor", withParameters:["color": colorLabel.text])
        buttonPresses += 1
        //The following line insures no out of bounds
        if (buttonPresses == colorsArray.count) {
            buttonPresses = 0
        }
        
        //added a switch statement to increment through background colors on button presses
        switch buttonPresses {
        case 1:
            self.view.backgroundColor = UIColor.gray;
        case 2:
            self.view.backgroundColor = UIColor.blue
        case 3:
            self.view.backgroundColor = UIColor.green
        case 4:
            self.view.backgroundColor = UIColor.yellow
        case 5:
            self.view.backgroundColor = UIColor.brown
        case 6:
            self.view.backgroundColor = UIColor.cyan
        case 7:
            self.view.backgroundColor = UIColor.magenta
        case 8:
            self.view.backgroundColor = UIColor.red
        case 9:
            self.view.backgroundColor = UIColor.purple
        default:
            self.view.backgroundColor = UIColor.white
        }
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
