import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var costPerPerson:Double?
    var split:Double?
    var noOfPeople:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=String(format:"%0.2f",costPerPerson ?? 0.0)
        settingsLabel.text = String("Split between \(noOfPeople ?? 0) people, with \((split ?? 0.0)*100)% tip.")
        
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
