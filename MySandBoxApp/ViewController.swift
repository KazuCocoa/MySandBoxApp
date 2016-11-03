import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var gistLits: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        gistLits.text = "viewDidLoad\n"
    }

    override func viewWillAppear(_ animated: Bool) {

        let client = MyHttpBinClient()
        client.getHttpBinGet()

        getGistAndUpdateView()
    }

    func getGistAndUpdateView() {
        Alamofire.request(GithubClient().githuGist)
            .responseJSON { response in
                if let JSON = response.result.value as? Array<Dictionary<String, AnyObject>> {
                    JSON.forEach { json in
                        let result = try? GitHubGist.decodeValue(json)
                        self.gistLits.text?.append("url: " + (result?.url)! + "\n")
                        self.gistLits.text?.append("id: " + (result?.id)! + "\n")
                        self.gistLits.text?.append("owner: " + (result?.owner)! + "\n\n")

                    }
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

