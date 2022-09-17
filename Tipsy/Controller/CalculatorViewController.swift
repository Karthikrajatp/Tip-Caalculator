

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        sender.isSelected = true
        let bonus = (sender.currentTitle)
        let bonusRemoveLast = String(bonus!.dropLast())
        let bonusDigit = Double(bonusRemoveLast)!
        tip = bonusDigit/100

    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       
        splitNumberLabel.text = String(format: "%0.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        billTotal = Double(bill)!
        result = (billTotal*tip + billTotal)/Double(numberOfPeople)
        performSegue(withIdentifier: "goToResult", sender:self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC=segue.destination as! ResultsViewController
            destinationVC.costPerPerson = result
            destinationVC.noOfPeople = numberOfPeople
            destinationVC.split = tip
        }
    }
    
}

