// https://httpbin.org/

import Alamofire

class MyHttpBinClient {
    func getHttpBinGet() {
        Alamofire.request(.GET, "https://httpbin.org/ip", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)

                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
}
