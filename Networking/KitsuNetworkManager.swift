import SwiftUI

class KitsuNetworkManager: ObservableObject {
    @Published var kitsu:Kitsu?

    init(kitsu: Kitsu? = nil) {
        self.kitsu = kitsu
        fetchAnime()
    }

    func fetchAnime() {
        guard let url = URL(string: "https://kitsu.io/api/edge/anime") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedKitsu = try JSONDecoder().decode(Kitsu.self, from: data)
                        self.kitsu = decodedKitsu
                        print(decodedKitsu)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }



}




