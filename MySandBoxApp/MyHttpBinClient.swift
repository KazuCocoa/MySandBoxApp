// https://httpbin.org/

import Alamofire
import Himotoki

struct BinClientGet: Decodable {
    let ip: String

    // MARK: Decodable

    static func decode(_ e: Extractor) throws -> BinClientGet {
        print("____________\(e)")
        return try BinClientGet(
            ip: e <| "origin"
        )
    }
}

class MyHttpBinClient {
    func getHttpBinGet() {
        Alamofire.request("https://httpbin.org/ip", method: .get, parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request ?? "")
                print(response.response ?? "")
                print(response.data ?? "")
                print(response.result)

                if let JSON = response.result.value {
                    let resultIp = try? BinClientGet.decodeValue(JSON)
                    print("[MyHttpBinClient]: ip is \(resultIp?.ip)")
                }
        }
    }
}
