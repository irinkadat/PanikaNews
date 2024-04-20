import Foundation
struct NetworkManager {
    static let shared = NetworkManager()
    
    func fetchNews(completion: @escaping ([NewsItem]?) -> Void) {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(newsResponse.list)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
