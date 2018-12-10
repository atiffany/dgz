import UIKit

class VotingViewController: UIViewController {
    
    
    @IBOutlet weak var dogImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dogImageURL = NSLocalizedString("landingImageURL", comment: "testing")
        let url = URL(string: dogImageURL)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            dogImage.image = UIImage(data: imageData)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callAPI() -> UIImage {
        let string = "https://dog.ceo/api/breeds/image/random"
        
        //create the url with NSURL
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: String] {
                    print(json)
                    let string = json["message"]
                    let url = URL(string: string) ?? ""
                    let data = try? Data(contentsOf: url)
                    
                    if let imageData = data {
                        return UIImage(data: imageData)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
        

    }
}
